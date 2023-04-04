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

String _$conversationsHash() => r'2d27751c8088e8924bbacf398641e98569d03406';

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
    r'5d6745a40e3e6a83a220a43357d5ba4ebef29649';

/// See also [CurrentConversation].
@ProviderFor(CurrentConversation)
final currentConversationProvider =
    AutoDisposeNotifierProvider<CurrentConversation, Conversation>.internal(
  CurrentConversation.new,
  name: r'currentConversationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentConversationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentConversation = AutoDisposeNotifier<Conversation>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
