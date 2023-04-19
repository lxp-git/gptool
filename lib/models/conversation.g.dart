// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Conversation _$$_ConversationFromJson(Map<String, dynamic> json) =>
    _$_Conversation(
      id: json['id'] as int?,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_ConversationToJson(_$_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$conversationsHash() => r'da9d17e16163e2bbc8fd827c60ed761380defc43';

/// See also [Conversations].
@ProviderFor(Conversations)
final conversationsProvider =
    AutoDisposeNotifierProvider<Conversations, List<Conversation>>.internal(
  Conversations.new,
  name: r'conversationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$conversationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Conversations = AutoDisposeNotifier<List<Conversation>>;
String _$currentConversationHash() =>
    r'9b54980f94e5f15f0e70ddd8a883775887cb375f';

/// See also [CurrentConversation].
@ProviderFor(CurrentConversation)
final currentConversationProvider =
    NotifierProvider<CurrentConversation, Conversation>.internal(
  CurrentConversation.new,
  name: r'currentConversationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentConversationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentConversation = Notifier<Conversation>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
