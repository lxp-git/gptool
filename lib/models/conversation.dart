import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gptool/models/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  void addConversation(Conversation conversation) {
    state = [...state, conversation];
  }
}

@riverpod
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
