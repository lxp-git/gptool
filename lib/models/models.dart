// class Conversation {
//   final int id;
//   final String title;
//   final DateTime createdAt;

//   Conversation(
//       {required this.id, required this.title, required this.createdAt});

//   Conversation.fromMap(Map<String, dynamic> json)
//       : id = json['id'],
//         title = json['title'],
//         createdAt = json['createdAt'];

//   Map<String, dynamic> toMap() =>
//       {"id": id, "title": title, "createdAt": createdAt};

//   copyWith({int? id, String? title, DateTime? createdAt}) => Conversation(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       createdAt: createdAt ?? this.createdAt);
// }

class Message {
  final int? id;
  final String userId;
  final DateTime createdAt;

  Message({required this.id, required this.userId, required this.createdAt});

  Message.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        createdAt = json['createdAt'];

  Map<String, dynamic> toMap() =>
      {"id": id, "userId": userId, "createdAt": createdAt};

  copyWith({int? id, String? userId, DateTime? createdAt}) => Message(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt);
}

mixin ReplyMessage {
  late final String replyTo;
}

class TextMessage extends Message with ReplyMessage {
  final String content;

  TextMessage(
      {required this.content,
      required super.id,
      required super.userId,
      required super.createdAt});
  @override
  copyWith({int? id, String? content, String? userId, DateTime? createdAt}) =>
      TextMessage(
          id: id ?? this.id,
          content: content ?? this.content,
          userId: userId ?? this.userId,
          createdAt: createdAt ?? this.createdAt);

  @override
  toMap() =>
      {"id": id, "content": content, "userId": userId, "createdAt": createdAt};
  TextMessage.fromMap(Map<String, dynamic> json)
      : content = json["content"],
        super.fromMap(json);
}

class GPTResponseMessage extends TextMessage with ReplyMessage {
  final List<GPTResponse> extra;

  GPTResponseMessage(
      {required super.id,
      required super.content,
      required super.userId,
      required this.extra,
      required super.createdAt});
  @override
  GPTResponseMessage copyWith(
          {int? id,
          String? content,
          String? userId,
          DateTime? createdAt,
          List<GPTResponse>? extra}) =>
      GPTResponseMessage(
          createdAt: createdAt ?? this.createdAt,
          id: id ?? this.id,
          content: content ?? this.content,
          userId: userId ?? this.userId,
          extra: extra ?? this.extra);

  @override
  toMap() => {...super.toMap(), "extra": extra.map((e) => e.toMap()).toList()};
  @override
  GPTResponseMessage.fromMap(Map<String, dynamic> json)
      : extra = List.generate(json["extra"].length,
            (index) => GPTResponse.fromMap(json["extra"][index])),
        super.fromMap(json);
}

class GPTResponse {
  int? id;
  String? object;
  int? created;
  String? model;
  Usage? usage;
  List<Choices>? choices;

  GPTResponse(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.usage,
      this.choices});

  GPTResponse.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    usage = json['usage'] != null ? Usage.fromMap(json['usage']) : null;
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(Choices.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['created'] = created;
    data['model'] = model;
    if (usage != null) {
      data['usage'] = usage!.toMap();
    }
    if (choices != null) {
      data['choices'] = choices!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromMap(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prompt_tokens'] = promptTokens;
    data['completion_tokens'] = completionTokens;
    data['total_tokens'] = totalTokens;
    return data;
  }
}

class Choices {
  GPTMessage? message;
  String? finishReason;
  int? index;

  Delta? delta;

  Choices({this.message, this.finishReason, this.index});

  Choices.fromMap(Map<String, dynamic> json) {
    message =
        json['message'] != null ? GPTMessage.fromMap(json['message']) : null;
    finishReason = json['finish_reason'];
    index = json['index'];
    delta = Delta.fromMap(json['delta']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (message != null) {
      data['message'] = message!.toMap();
    }
    data['finish_reason'] = finishReason;
    data['index'] = index;
    data['delta'] = delta?.toMap();
    return data;
  }
}

class GPTMessage {
  String? role;
  String? content;

  GPTMessage({this.role, this.content});

  GPTMessage.fromMap(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['content'] = content;
    return data;
  }
}

class Delta {
  String? content;
  String? role;

  Delta({this.content, this.role});

  Delta.fromMap(Map<String, dynamic> json) {
    content = json['content'];
    role = json['role'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['role'] = role;
    return data;
  }
}
