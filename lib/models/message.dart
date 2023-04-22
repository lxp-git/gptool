import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gptool/models/conversation.dart';
import 'package:gptool/utils/db/message.dart';
import 'package:gptool/utils/key_value_store_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../utils/http/client.dart';

part 'message.g.dart';
part 'message.freezed.dart';

@freezed
class Message with _$Message {
  factory Message.text(
      {int? id,
      required String content,
      required String userId,
      required int conversationId,
      required DateTime createdAt}) = _text;

  factory Message.openAI(
      {int? id,
      required int replyTo,
      required String content,
      required String userId,
      required int conversationId,
      required List<GPTResponse> extra,
      required DateTime createdAt}) = _openAI;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);
}

@freezed
class GPTResponse with _$GPTResponse {
  factory GPTResponse(
      {String? id,
      String? object,
      int? created,
      String? model,
      Usage? usage,
      List<Choices>? choices}) = _GPTResponse;
  factory GPTResponse.fromJson(Map<String, Object?> json) =>
      _$GPTResponseFromJson(json);
}

@freezed
class Usage with _$Usage {
  factory Usage({int? promptTokens, int? completionTokens, int? totalTokens}) =
      _Usage;
  factory Usage.fromJson(Map<String, Object?> json) => _$UsageFromJson(json);
}

@freezed
class Choices with _$Choices {
  factory Choices(
      {GPTMessage? message,
      String? finishReason,
      int? index,
      Delta? delta}) = _Choices;
  factory Choices.fromJson(Map<String, Object?> json) =>
      _$ChoicesFromJson(json);
}

@freezed
class GPTMessage with _$GPTMessage {
  factory GPTMessage({String? role, String? content}) = _GPTMessage;
  factory GPTMessage.fromJson(Map<String, Object?> json) =>
      _$GPTMessageFromJson(json);
}

@freezed
class Delta with _$Delta {
  factory Delta({String? content, String? role}) = _Delta;
  factory Delta.fromJson(Map<String, Object?> json) => _$DeltaFromJson(json);
}

@riverpod
class CurrentConversationMessages extends _$CurrentConversationMessages {
  final TextEditingController textEditingController = TextEditingController();
  @override
  List<Message> build() {
    return [];
  }

  currentConversationChanged() async {
    final conversation = ref.read(currentConversationProvider);
    print("currentConversationChanged:${conversation.toJson()}");
    final List<Message> messages =
        await MessageDBProvider().findAll(conversationId: conversation.id);
    state = messages;
  }

  sendMessageByOpenAI(
      String content, Message responseMessage, String body) async {
    final messageList = state;
    final request = http.Request(
        "POST", Uri.parse("https://api.openai.com/v1/chat/completions"));
    request.body = body;
    request.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": "Bearer ${KeyValueStoreHelper().secretKey}",
    });
    final responseStream = await client.send(request);
    final lineStream = responseStream.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter());
    lineStream.listen((dataLine) {
      print("OpenAI dataLine:$dataLine");
      if (dataLine.isEmpty) {
        return;
      }
      Match match = RegExp(r'^([^:]*)(?::)?(?: )?(.*)?$').firstMatch(dataLine)!;
      var field = match.group(1);
      if (field!.isEmpty) {
        return;
      }
      var value = '';
      if (field == 'data') {
        value = dataLine.substring(
          5,
        );
      } else {
        value = match.group(2) ?? '';
      }
      switch (field) {
        case 'event':
          break;
        case 'data':
          if (value.contains('[DONE]')) {
            MessageDBProvider().update(state
                .firstWhere((element) => element.id == responseMessage.id));
            return;
          }

          final response = GPTResponse.fromJson(jsonDecode(value));
          state = state.map((element) {
            if (element.id == responseMessage.id) {
              return element.map(
                  text: (value) => value,
                  openAI: (value) {
                    String content = "";
                    List<GPTResponse> extra = [];
                    if (value.extra[0].id == null) {
                      content = response.choices?[0].delta?.content ?? "";
                      extra = [response];
                    } else {
                      content = value.content +
                          (response.choices?[0].delta?.content ?? "");
                      extra = [...value.extra, response];
                    }
                    return value.copyWith(content: content, extra: extra);
                  });
            }
            return element;
          }).toList();

          break;
        case 'id':
          break;
        case 'retry':
          break;
      }
    });
  }

  sendMessageByChatGPTNextWeb(
      String content, Message responseMessage, String body) async {
    final messageList = state;
    final chatGPTNextWebConfiguration =
        KeyValueStoreHelper().chatGPTNextWebConfiguration!;
    final request =
        http.Request("POST", Uri.parse(chatGPTNextWebConfiguration.domain));
    request.body = body;
    request.headers.addAll({
      "Content-Type": "application/json",
      "access-code": chatGPTNextWebConfiguration.accessCode,
      "path": chatGPTNextWebConfiguration.path,
    });
    final responseStream = await client.send(request);
    final lineStream = responseStream.stream.transform(utf8.decoder);
    lineStream.listen((dataLine) {
      print("ChatGPTNextWeb dataLine:$dataLine");
      if (dataLine.isEmpty) {
        return;
      }
      state = state.map((element) {
        if (element.id == responseMessage.id) {
          return element.map(
              text: (value) => value,
              openAI: (value) {
                String content = value.content;
                List<GPTResponse> extra = [];
                if (value.extra[0].choices == null) {
                  content = dataLine;
                } else {
                  content += dataLine;
                }
                return value.copyWith(content: content, extra: [
                  _GPTResponse(choices: [
                    Choices(delta: Delta(role: "assistant", content: content))
                  ])
                ]);
              });
        }
        return element;
      }).toList();
      MessageDBProvider().update(
          state.firstWhere((element) => element.id == responseMessage.id));
    });
  }

  sendMessage(String content) async {
    final body = jsonEncode({
      "model": "gpt-3.5-turbo",
      "messages": [
        ...state.reversed.map((e) {
          return e.map(
              text: (value) => {"role": "user", "content": e.content},
              openAI: (value) => {
                    "role": value.extra[0].choices?[0].delta?.role,
                    "content": e.content
                  });
        }),
        {"role": "user", "content": content}
      ],
      "stream": true,
      "temperature": 1,
      "presence_penalty": 0
    });
    final conversationId = ref.read(currentConversationProvider).id!;
    final message = await MessageDBProvider().insert(Message.text(
        content: content,
        userId: "0",
        conversationId: conversationId,
        createdAt: DateTime.now()));
    state = [...state..insert(0, message)];
    String sendToUserId = "OpenAI";
    if (KeyValueStoreHelper().secretKey != null &&
        KeyValueStoreHelper().secretKey!.isNotEmpty) {
      sendToUserId = "OpenAI";
    } else if (KeyValueStoreHelper().secretKey?.isNotEmpty != null) {
      sendToUserId = "ChatGPTNextWeb";
    }
    final responseMessage = await MessageDBProvider().insert(Message.openAI(
        content: "loading....",
        userId: sendToUserId,
        replyTo: message.id!,
        extra: [GPTResponse()],
        conversationId: conversationId,
        createdAt: DateTime.now()));
    state = [responseMessage, ...state];
    textEditingController.clear();

    if (KeyValueStoreHelper().secretKey != null &&
        KeyValueStoreHelper().secretKey!.isNotEmpty) {
      sendMessageByOpenAI(content, responseMessage, body);
    } else if (KeyValueStoreHelper().chatGPTNextWebConfiguration != null &&
        KeyValueStoreHelper().chatGPTNextWebConfiguration!.domain.isNotEmpty) {
      print("sendMessageByChatGPTNextWeb");
      sendMessageByChatGPTNextWeb(content, responseMessage, body);
    }
  }

  updateMessage(String newMessage, Message editingMessage) async {
    await MessageDBProvider().deleteAfter(editingMessage.id!);
    state = state.where((element) => element.id! < editingMessage.id!).toList();
    sendMessage(newMessage);
  }
}

// @riverpod
// class AsyncCurrentConversationMessages
//     extends _$AsyncCurrentConversationMessages {
//   @override
//   Future<List<Message>> build() async {
//     final conversationId = ref.read(currentConversationProvider).id;
//     final messsages =
//         await MessageDBProvider().findAll(conversationId: conversationId);
//     return messsages;
//   }

//   currentConversationChanged() async {
//     state = const AsyncValue.loading();
//     state = await AsyncValue.guard(() async {
//       final conversation = ref.read(currentConversationProvider);
//       final List<Message> messages =
//           await MessageDBProvider().findAll(conversationId: conversation.id);
//       return messages;
//     });
//   }

//   late Stream<Message> resultStream;

//   sendMessage(String content) async {
//     final messageList = state.value ?? [];

//     final request = http.Request(
//         "POST", Uri.parse("https://api.openai.com/v1/chat/completions"));
//     request.body = jsonEncode({
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         ...messageList.map((e) {
//           print(
//               "jsonEncode:${e.map(text: (value) => value, openAI: (value) => value)}");
//           return {"role": "user", "content": e.content};
//         }),
//         {"role": "user", "content": content}
//       ],
//       "stream": true
//     });
//     final responseMessage = Message.openAI(
//         content: "",
//         userId: "OpenAI",
//         extra: [GPTResponse()],
//         conversationId: ref.read(currentConversationProvider).id!,
//         createdAt: DateTime.now());
//     state = await AsyncValue.guard(() async {
//       return [
//         ...state.value!
//           ..insert(
//               0,
//               await MessageDBProvider().insert(Message.text(
//                   content: content,
//                   userId: "0",
//                   conversationId: ref.read(currentConversationProvider).id!,
//                   createdAt: DateTime.now())))
//       ];
//     });
//     state = await AsyncValue.guard(() async {
//       return [
//         ...state.value!
//           ..insert(
//               0,
//               await MessageDBProvider().insert(Message.openAI(
//                   content: "......",
//                   userId: "0",
//                   conversationId: ref.read(currentConversationProvider).id!,
//                   createdAt: DateTime.now(),
//                   extra: [])))
//       ];
//     });
//     request.headers.addAll({
//       "Content-Type": "application/json",
//       "Authorization": "Bearer ${KeyValueStoreHelper().secretKey}",
//       "Accept": "application/json; charset=utf-8"
//     });
//     String data = "";
//     request.send().then((value) async {
//       value.stream
//           .transform(utf8.decoder)
//           .transform(const LineSplitter())
//           .listen((dataLine) {
//         print("dataLine:$dataLine");
//         if (dataLine.isEmpty) {
//           return;
//         }
//         Match match =
//             RegExp(r'^([^:]*)(?::)?(?: )?(.*)?$').firstMatch(dataLine)!;
//         var field = match.group(1);
//         if (field!.isEmpty) {
//           return;
//         }
//         var value = '';
//         if (field == 'data') {
//           value = dataLine.substring(
//             5,
//           );
//         } else {
//           value = match.group(2) ?? '';
//         }
//         switch (field) {
//           case 'event':
//             break;
//           case 'data':
//             if (value.contains('[DONE]')) {
//               state = await AsyncValue.guard(() async {
//       return [
//         ...state.value!
//           ..insert(
//               0,
//               await MessageDBProvider().insert(Message.openAI(
//                   content: "......",
//                   userId: "0",
//                   conversationId: ref.read(currentConversationProvider).id!,
//                   createdAt: DateTime.now(),
//                   extra: [])))
//       ];
//     });
//               state
//               MessageDBProvider()
//                   .insert(responseMessage)
//                   .then((final responseWithId) => setState(() {
//                         messageList = messageList.map((e) {
//                           if (e == responseMessage) {
//                             return responseWithId;
//                           }
//                           return e;
//                         }).toList();
//                       }));

//               return;
//             }

//             final response = GPTResponse.fromJson(jsonDecode(value));
//             setState(() {
//               messageList = messageList.map((e) {
//                 return e.map(
//                     text: (value) => value,
//                     openAI: (value) => value.copyWith(
//                         content: e.content +
//                             (response.choices?[0].delta?.content ?? "")));
//               }).toList();
//             });

//             break;
//           case 'id':
//             break;
//           case 'retry':
//             break;
//         }
//       });
//     });
//   }
// }

// @riverpod
// class StreamMessages extends _$StreamMessages {
//   @override
//   Stream<List<Message>> build() async* {
//     print("messages build");
//     yield [];

//     // await Future.delayed(const Duration(seconds: 3));
//     // yield [
//     //   Message.text(
//     //       content: "1",
//     //       userId: "0",
//     //       conversationId: 5,
//     //       createdAt: DateTime.now())
//     // ];
//     // await Future.delayed(const Duration(seconds: 3));
//     // yield [
//     //   Message.text(
//     //       content: "2",
//     //       userId: "0",
//     //       conversationId: 5,
//     //       createdAt: DateTime.now())
//     // ];
//     // await Future.delayed(const Duration(seconds: 3));
//     // yield [
//     //   Message.text(
//     //       content: "3",
//     //       userId: "0",
//     //       conversationId: 5,
//     //       createdAt: DateTime.now())
//     // ];
//     // await Future.delayed(const Duration(seconds: 3));
//     // yield [
//     //   Message.text(
//     //       content: "4",
//     //       userId: "0",
//     //       conversationId: 5,
//     //       createdAt: DateTime.now())
//     // ];
//     // await Future.delayed(const Duration(seconds: 3));
//     // yield [
//     //   Message.text(
//     //       content: "5",
//     //       userId: "0",
//     //       conversationId: 5,
//     //       createdAt: DateTime.now())
//     // ];
//   }

//   void test() {
//     print("messages test");
//     // state = AsyncValue.data([
//     //   Message.text(
//     //       content: "6",
//     //       userId: "0",
//     //       conversationId: 5,
//     //       createdAt: DateTime.now())
//     // ]);
//     // state = AsyncValue.guard(
//     //   () {
//     //     return [];
//     //   },
//     // );
//   }

//   Stream<List<Message>> currentConversationChanged() async* {
//     print("messages currentConversationChanged");
//     final conversation = ref.read(currentConversationProvider);
//     final List<Message> messages =
//         await MessageDBProvider().findAll(conversationId: conversation.id);
//     print("messages:$messages");
//     yield messages;
//   }

//   sendMessage(content) {
//     sendMessage2(content).listen((event) {
//       state = AsyncData(event);
//     });
//   }

//   Stream<List<Message>> sendMessage2(content) async* {
//     final messageList = state.value!;

//     final request = http.Request(
//         "POST", Uri.parse("https://api.openai.com/v1/chat/completions"));
//     request.body = jsonEncode({
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         ...messageList.map((e) {
//           return e.map(text: (value) => value, openAI: (value) => value);
//         }),
//         {"role": "user", "content": content}
//       ],
//       "stream": true
//     });
//     final message = await MessageDBProvider().insert(Message.text(
//         content: content,
//         userId: "0",
//         conversationId: ref.read(currentConversationProvider).id!,
//         createdAt: DateTime.now()));
//     yield [message, ...messageList];
//     final responseMessage = Message.openAI(
//         content: "",
//         userId: "OpenAI",
//         extra: [GPTResponse()],
//         conversationId: ref.read(currentConversationProvider).id!,
//         createdAt: DateTime.now());
//     yield [responseMessage, ...messageList];
//     request.headers.addAll({
//       "Content-Type": "application/json",
//       "Authorization": "Bearer ${KeyValueStoreHelper().secretKey}",
//       "Accept": "application/json; charset=utf-8"
//     });
//     String data = "";
//     final streamResponse = await request.send();
//     await for (final dataLineList in streamResponse.stream
//         .map(utf8.decode)
//         .map(const LineSplitter().convert)) {
//       for (final dataLine in dataLineList) {
//         if (dataLine.isEmpty) {
//           return;
//         }
//         Match match =
//             RegExp(r'^([^:]*)(?::)?(?: )?(.*)?$').firstMatch(dataLine)!;
//         var field = match.group(1);
//         if (field!.isEmpty) {
//           return;
//         }
//         var value = '';
//         if (field == 'data') {
//           value = dataLine.substring(
//             5,
//           );
//         } else {
//           value = match.group(2) ?? '';
//         }
//         switch (field) {
//           case 'event':
//             break;
//           case 'data':
//             if (value.contains('[DONE]')) {
//               yield [
//                 await MessageDBProvider().insert(responseMessage),
//                 ...state.value!
//               ];
//               return;
//             }

//             final response = GPTResponse.fromJson(jsonDecode(value));
//             yield messageList.map((e) {
//               return e.map(
//                   text: (value) => value,
//                   openAI: (value) => value.copyWith(
//                       content: e.content +
//                           (response.choices?[0].delta?.content ?? "")));
//             }).toList();

//             break;
//           case 'id':
//             break;
//           case 'retry':
//             break;
//         }
//       }
//     }
//   }
// }
