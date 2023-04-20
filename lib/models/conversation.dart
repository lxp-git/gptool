import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gptool/models/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/db/conversation.dart';

part 'conversation.g.dart';
part 'conversation.freezed.dart';

@freezed
class Conversation with _$Conversation {
  factory Conversation(
      {int? id,
      required String title,
      required DateTime createdAt}) = _Conversation;

  factory Conversation.fromJson(Map<String, Object?> json) =>
      _$ConversationFromJson(json);
}

@riverpod
class Conversations extends _$Conversations {
  static List<Conversation> defaultConversations = [];

  @override
  List<Conversation> build() {
    return defaultConversations;
  }

  void addConversation() async {
    final conversation = await ConversationDBProvider()
        .insert(Conversation(title: "New Chat", createdAt: DateTime.now()));
    state = [conversation, ...state];
    ref
        .read(currentConversationProvider.notifier)
        .selectConversation(conversation);
  }

  void delete(Conversation conversation) async {
    if (state.length <= 1) {
      return;
    }
    final results = await ConversationDBProvider().delete(conversation.id!);
    state = state.where((element) => element.id != conversation.id).toList();

    ref
        .read(currentConversationProvider.notifier)
        .selectConversation(state.first);
  }
}

@Riverpod(keepAlive: true)
class CurrentConversation extends _$CurrentConversation {
  @override
  Conversation build() {
    final conversation = ref.read(conversationsProvider).first;
    return conversation;
  }

  void selectConversation(Conversation conversation) {
    state = conversation;
    ref
        .read(currentConversationMessagesProvider.notifier)
        .currentConversationChanged();
  }
}
