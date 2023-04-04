// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_text _$$_textFromJson(Map<String, dynamic> json) => _$_text(
      id: json['id'] as int?,
      content: json['content'] as String,
      userId: json['userId'] as String,
      conversationId: json['conversationId'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_textToJson(_$_text instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'userId': instance.userId,
      'conversationId': instance.conversationId,
      'createdAt': instance.createdAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$_openAI _$$_openAIFromJson(Map<String, dynamic> json) => _$_openAI(
      id: json['id'] as int?,
      replyTo: json['replyTo'] as int,
      content: json['content'] as String,
      userId: json['userId'] as String,
      conversationId: json['conversationId'] as int,
      extra: (json['extra'] as List<dynamic>)
          .map((e) => GPTResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_openAIToJson(_$_openAI instance) => <String, dynamic>{
      'id': instance.id,
      'replyTo': instance.replyTo,
      'content': instance.content,
      'userId': instance.userId,
      'conversationId': instance.conversationId,
      'extra': instance.extra,
      'createdAt': instance.createdAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$_GPTResponse _$$_GPTResponseFromJson(Map<String, dynamic> json) =>
    _$_GPTResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      created: json['created'] as int?,
      model: json['model'] as String?,
      usage: json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GPTResponseToJson(_$_GPTResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'usage': instance.usage,
      'choices': instance.choices,
    };

_$_Usage _$$_UsageFromJson(Map<String, dynamic> json) => _$_Usage(
      promptTokens: json['promptTokens'] as int?,
      completionTokens: json['completionTokens'] as int?,
      totalTokens: json['totalTokens'] as int?,
    );

Map<String, dynamic> _$$_UsageToJson(_$_Usage instance) => <String, dynamic>{
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
      'totalTokens': instance.totalTokens,
    };

_$_Choices _$$_ChoicesFromJson(Map<String, dynamic> json) => _$_Choices(
      message: json['message'] == null
          ? null
          : GPTMessage.fromJson(json['message'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String?,
      index: json['index'] as int?,
      delta: json['delta'] == null
          ? null
          : Delta.fromJson(json['delta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChoicesToJson(_$_Choices instance) =>
    <String, dynamic>{
      'message': instance.message,
      'finishReason': instance.finishReason,
      'index': instance.index,
      'delta': instance.delta,
    };

_$_GPTMessage _$$_GPTMessageFromJson(Map<String, dynamic> json) =>
    _$_GPTMessage(
      role: json['role'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_GPTMessageToJson(_$_GPTMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

_$_Delta _$$_DeltaFromJson(Map<String, dynamic> json) => _$_Delta(
      content: json['content'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$_DeltaToJson(_$_Delta instance) => <String, dynamic>{
      'content': instance.content,
      'role': instance.role,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentConversationMessagesHash() =>
    r'7d181ac48bbd57869c26fcde31ec0ccbb3082b63';

/// See also [CurrentConversationMessages].
@ProviderFor(CurrentConversationMessages)
final currentConversationMessagesProvider = AutoDisposeNotifierProvider<
    CurrentConversationMessages, List<Message>>.internal(
  CurrentConversationMessages.new,
  name: r'currentConversationMessagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentConversationMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentConversationMessages = AutoDisposeNotifier<List<Message>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
