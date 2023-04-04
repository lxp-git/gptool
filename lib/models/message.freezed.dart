// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'text':
      return _text.fromJson(json);
    case 'openAI':
      return _openAI.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Message',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Message {
  int? get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get conversationId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id, String content, String userId,
            int conversationId, DateTime createdAt)
        text,
    required TResult Function(
            int? id,
            int replyTo,
            String content,
            String userId,
            int conversationId,
            List<GPTResponse> extra,
            DateTime createdAt)
        openAI,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id, String content, String userId,
            int conversationId, DateTime createdAt)?
        text,
    TResult? Function(int? id, int replyTo, String content, String userId,
            int conversationId, List<GPTResponse> extra, DateTime createdAt)?
        openAI,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id, String content, String userId, int conversationId,
            DateTime createdAt)?
        text,
    TResult Function(int? id, int replyTo, String content, String userId,
            int conversationId, List<GPTResponse> extra, DateTime createdAt)?
        openAI,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_text value) text,
    required TResult Function(_openAI value) openAI,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_text value)? text,
    TResult? Function(_openAI value)? openAI,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_text value)? text,
    TResult Function(_openAI value)? openAI,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {int? id,
      String content,
      String userId,
      int conversationId,
      DateTime createdAt});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
    Object? userId = null,
    Object? conversationId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_textCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_textCopyWith(_$_text value, $Res Function(_$_text) then) =
      __$$_textCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String content,
      String userId,
      int conversationId,
      DateTime createdAt});
}

/// @nodoc
class __$$_textCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res, _$_text>
    implements _$$_textCopyWith<$Res> {
  __$$_textCopyWithImpl(_$_text _value, $Res Function(_$_text) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
    Object? userId = null,
    Object? conversationId = null,
    Object? createdAt = null,
  }) {
    return _then(_$_text(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_text implements _text {
  _$_text(
      {this.id,
      required this.content,
      required this.userId,
      required this.conversationId,
      required this.createdAt,
      final String? $type})
      : $type = $type ?? 'text';

  factory _$_text.fromJson(Map<String, dynamic> json) => _$$_textFromJson(json);

  @override
  final int? id;
  @override
  final String content;
  @override
  final String userId;
  @override
  final int conversationId;
  @override
  final DateTime createdAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.text(id: $id, content: $content, userId: $userId, conversationId: $conversationId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_text &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, userId, conversationId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_textCopyWith<_$_text> get copyWith =>
      __$$_textCopyWithImpl<_$_text>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id, String content, String userId,
            int conversationId, DateTime createdAt)
        text,
    required TResult Function(
            int? id,
            int replyTo,
            String content,
            String userId,
            int conversationId,
            List<GPTResponse> extra,
            DateTime createdAt)
        openAI,
  }) {
    return text(id, content, userId, conversationId, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id, String content, String userId,
            int conversationId, DateTime createdAt)?
        text,
    TResult? Function(int? id, int replyTo, String content, String userId,
            int conversationId, List<GPTResponse> extra, DateTime createdAt)?
        openAI,
  }) {
    return text?.call(id, content, userId, conversationId, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id, String content, String userId, int conversationId,
            DateTime createdAt)?
        text,
    TResult Function(int? id, int replyTo, String content, String userId,
            int conversationId, List<GPTResponse> extra, DateTime createdAt)?
        openAI,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(id, content, userId, conversationId, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_text value) text,
    required TResult Function(_openAI value) openAI,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_text value)? text,
    TResult? Function(_openAI value)? openAI,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_text value)? text,
    TResult Function(_openAI value)? openAI,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_textToJson(
      this,
    );
  }
}

abstract class _text implements Message {
  factory _text(
      {final int? id,
      required final String content,
      required final String userId,
      required final int conversationId,
      required final DateTime createdAt}) = _$_text;

  factory _text.fromJson(Map<String, dynamic> json) = _$_text.fromJson;

  @override
  int? get id;
  @override
  String get content;
  @override
  String get userId;
  @override
  int get conversationId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_textCopyWith<_$_text> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_openAICopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_openAICopyWith(_$_openAI value, $Res Function(_$_openAI) then) =
      __$$_openAICopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int replyTo,
      String content,
      String userId,
      int conversationId,
      List<GPTResponse> extra,
      DateTime createdAt});
}

/// @nodoc
class __$$_openAICopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_openAI>
    implements _$$_openAICopyWith<$Res> {
  __$$_openAICopyWithImpl(_$_openAI _value, $Res Function(_$_openAI) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? replyTo = null,
    Object? content = null,
    Object? userId = null,
    Object? conversationId = null,
    Object? extra = null,
    Object? createdAt = null,
  }) {
    return _then(_$_openAI(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      replyTo: null == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      extra: null == extra
          ? _value._extra
          : extra // ignore: cast_nullable_to_non_nullable
              as List<GPTResponse>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_openAI implements _openAI {
  _$_openAI(
      {this.id,
      required this.replyTo,
      required this.content,
      required this.userId,
      required this.conversationId,
      required final List<GPTResponse> extra,
      required this.createdAt,
      final String? $type})
      : _extra = extra,
        $type = $type ?? 'openAI';

  factory _$_openAI.fromJson(Map<String, dynamic> json) =>
      _$$_openAIFromJson(json);

  @override
  final int? id;
  @override
  final int replyTo;
  @override
  final String content;
  @override
  final String userId;
  @override
  final int conversationId;
  final List<GPTResponse> _extra;
  @override
  List<GPTResponse> get extra {
    if (_extra is EqualUnmodifiableListView) return _extra;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extra);
  }

  @override
  final DateTime createdAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Message.openAI(id: $id, replyTo: $replyTo, content: $content, userId: $userId, conversationId: $conversationId, extra: $extra, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_openAI &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            const DeepCollectionEquality().equals(other._extra, _extra) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, replyTo, content, userId,
      conversationId, const DeepCollectionEquality().hash(_extra), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_openAICopyWith<_$_openAI> get copyWith =>
      __$$_openAICopyWithImpl<_$_openAI>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? id, String content, String userId,
            int conversationId, DateTime createdAt)
        text,
    required TResult Function(
            int? id,
            int replyTo,
            String content,
            String userId,
            int conversationId,
            List<GPTResponse> extra,
            DateTime createdAt)
        openAI,
  }) {
    return openAI(
        id, replyTo, content, userId, conversationId, extra, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? id, String content, String userId,
            int conversationId, DateTime createdAt)?
        text,
    TResult? Function(int? id, int replyTo, String content, String userId,
            int conversationId, List<GPTResponse> extra, DateTime createdAt)?
        openAI,
  }) {
    return openAI?.call(
        id, replyTo, content, userId, conversationId, extra, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? id, String content, String userId, int conversationId,
            DateTime createdAt)?
        text,
    TResult Function(int? id, int replyTo, String content, String userId,
            int conversationId, List<GPTResponse> extra, DateTime createdAt)?
        openAI,
    required TResult orElse(),
  }) {
    if (openAI != null) {
      return openAI(
          id, replyTo, content, userId, conversationId, extra, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_text value) text,
    required TResult Function(_openAI value) openAI,
  }) {
    return openAI(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_text value)? text,
    TResult? Function(_openAI value)? openAI,
  }) {
    return openAI?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_text value)? text,
    TResult Function(_openAI value)? openAI,
    required TResult orElse(),
  }) {
    if (openAI != null) {
      return openAI(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_openAIToJson(
      this,
    );
  }
}

abstract class _openAI implements Message {
  factory _openAI(
      {final int? id,
      required final int replyTo,
      required final String content,
      required final String userId,
      required final int conversationId,
      required final List<GPTResponse> extra,
      required final DateTime createdAt}) = _$_openAI;

  factory _openAI.fromJson(Map<String, dynamic> json) = _$_openAI.fromJson;

  @override
  int? get id;
  int get replyTo;
  @override
  String get content;
  @override
  String get userId;
  @override
  int get conversationId;
  List<GPTResponse> get extra;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_openAICopyWith<_$_openAI> get copyWith =>
      throw _privateConstructorUsedError;
}

GPTResponse _$GPTResponseFromJson(Map<String, dynamic> json) {
  return _GPTResponse.fromJson(json);
}

/// @nodoc
mixin _$GPTResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get object => throw _privateConstructorUsedError;
  int? get created => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  Usage? get usage => throw _privateConstructorUsedError;
  List<Choices>? get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GPTResponseCopyWith<GPTResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GPTResponseCopyWith<$Res> {
  factory $GPTResponseCopyWith(
          GPTResponse value, $Res Function(GPTResponse) then) =
      _$GPTResponseCopyWithImpl<$Res, GPTResponse>;
  @useResult
  $Res call(
      {String? id,
      String? object,
      int? created,
      String? model,
      Usage? usage,
      List<Choices>? choices});

  $UsageCopyWith<$Res>? get usage;
}

/// @nodoc
class _$GPTResponseCopyWithImpl<$Res, $Val extends GPTResponse>
    implements $GPTResponseCopyWith<$Res> {
  _$GPTResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? object = freezed,
    Object? created = freezed,
    Object? model = freezed,
    Object? usage = freezed,
    Object? choices = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage?,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choices>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageCopyWith<$Res>? get usage {
    if (_value.usage == null) {
      return null;
    }

    return $UsageCopyWith<$Res>(_value.usage!, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GPTResponseCopyWith<$Res>
    implements $GPTResponseCopyWith<$Res> {
  factory _$$_GPTResponseCopyWith(
          _$_GPTResponse value, $Res Function(_$_GPTResponse) then) =
      __$$_GPTResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? object,
      int? created,
      String? model,
      Usage? usage,
      List<Choices>? choices});

  @override
  $UsageCopyWith<$Res>? get usage;
}

/// @nodoc
class __$$_GPTResponseCopyWithImpl<$Res>
    extends _$GPTResponseCopyWithImpl<$Res, _$_GPTResponse>
    implements _$$_GPTResponseCopyWith<$Res> {
  __$$_GPTResponseCopyWithImpl(
      _$_GPTResponse _value, $Res Function(_$_GPTResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? object = freezed,
    Object? created = freezed,
    Object? model = freezed,
    Object? usage = freezed,
    Object? choices = freezed,
  }) {
    return _then(_$_GPTResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      usage: freezed == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as Usage?,
      choices: freezed == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Choices>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GPTResponse implements _GPTResponse {
  _$_GPTResponse(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.usage,
      final List<Choices>? choices})
      : _choices = choices;

  factory _$_GPTResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GPTResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? object;
  @override
  final int? created;
  @override
  final String? model;
  @override
  final Usage? usage;
  final List<Choices>? _choices;
  @override
  List<Choices>? get choices {
    final value = _choices;
    if (value == null) return null;
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GPTResponse(id: $id, object: $object, created: $created, model: $model, usage: $usage, choices: $choices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GPTResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, model,
      usage, const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GPTResponseCopyWith<_$_GPTResponse> get copyWith =>
      __$$_GPTResponseCopyWithImpl<_$_GPTResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GPTResponseToJson(
      this,
    );
  }
}

abstract class _GPTResponse implements GPTResponse {
  factory _GPTResponse(
      {final String? id,
      final String? object,
      final int? created,
      final String? model,
      final Usage? usage,
      final List<Choices>? choices}) = _$_GPTResponse;

  factory _GPTResponse.fromJson(Map<String, dynamic> json) =
      _$_GPTResponse.fromJson;

  @override
  String? get id;
  @override
  String? get object;
  @override
  int? get created;
  @override
  String? get model;
  @override
  Usage? get usage;
  @override
  List<Choices>? get choices;
  @override
  @JsonKey(ignore: true)
  _$$_GPTResponseCopyWith<_$_GPTResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Usage _$UsageFromJson(Map<String, dynamic> json) {
  return _Usage.fromJson(json);
}

/// @nodoc
mixin _$Usage {
  int? get promptTokens => throw _privateConstructorUsedError;
  int? get completionTokens => throw _privateConstructorUsedError;
  int? get totalTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsageCopyWith<Usage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCopyWith<$Res> {
  factory $UsageCopyWith(Usage value, $Res Function(Usage) then) =
      _$UsageCopyWithImpl<$Res, Usage>;
  @useResult
  $Res call({int? promptTokens, int? completionTokens, int? totalTokens});
}

/// @nodoc
class _$UsageCopyWithImpl<$Res, $Val extends Usage>
    implements $UsageCopyWith<$Res> {
  _$UsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = freezed,
    Object? completionTokens = freezed,
    Object? totalTokens = freezed,
  }) {
    return _then(_value.copyWith(
      promptTokens: freezed == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      completionTokens: freezed == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTokens: freezed == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsageCopyWith<$Res> implements $UsageCopyWith<$Res> {
  factory _$$_UsageCopyWith(_$_Usage value, $Res Function(_$_Usage) then) =
      __$$_UsageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? promptTokens, int? completionTokens, int? totalTokens});
}

/// @nodoc
class __$$_UsageCopyWithImpl<$Res> extends _$UsageCopyWithImpl<$Res, _$_Usage>
    implements _$$_UsageCopyWith<$Res> {
  __$$_UsageCopyWithImpl(_$_Usage _value, $Res Function(_$_Usage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = freezed,
    Object? completionTokens = freezed,
    Object? totalTokens = freezed,
  }) {
    return _then(_$_Usage(
      promptTokens: freezed == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      completionTokens: freezed == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTokens: freezed == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Usage implements _Usage {
  _$_Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  factory _$_Usage.fromJson(Map<String, dynamic> json) =>
      _$$_UsageFromJson(json);

  @override
  final int? promptTokens;
  @override
  final int? completionTokens;
  @override
  final int? totalTokens;

  @override
  String toString() {
    return 'Usage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Usage &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promptTokens, completionTokens, totalTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsageCopyWith<_$_Usage> get copyWith =>
      __$$_UsageCopyWithImpl<_$_Usage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsageToJson(
      this,
    );
  }
}

abstract class _Usage implements Usage {
  factory _Usage(
      {final int? promptTokens,
      final int? completionTokens,
      final int? totalTokens}) = _$_Usage;

  factory _Usage.fromJson(Map<String, dynamic> json) = _$_Usage.fromJson;

  @override
  int? get promptTokens;
  @override
  int? get completionTokens;
  @override
  int? get totalTokens;
  @override
  @JsonKey(ignore: true)
  _$$_UsageCopyWith<_$_Usage> get copyWith =>
      throw _privateConstructorUsedError;
}

Choices _$ChoicesFromJson(Map<String, dynamic> json) {
  return _Choices.fromJson(json);
}

/// @nodoc
mixin _$Choices {
  GPTMessage? get message => throw _privateConstructorUsedError;
  String? get finishReason => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  Delta? get delta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoicesCopyWith<Choices> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoicesCopyWith<$Res> {
  factory $ChoicesCopyWith(Choices value, $Res Function(Choices) then) =
      _$ChoicesCopyWithImpl<$Res, Choices>;
  @useResult
  $Res call(
      {GPTMessage? message, String? finishReason, int? index, Delta? delta});

  $GPTMessageCopyWith<$Res>? get message;
  $DeltaCopyWith<$Res>? get delta;
}

/// @nodoc
class _$ChoicesCopyWithImpl<$Res, $Val extends Choices>
    implements $ChoicesCopyWith<$Res> {
  _$ChoicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? finishReason = freezed,
    Object? index = freezed,
    Object? delta = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as GPTMessage?,
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      delta: freezed == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Delta?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GPTMessageCopyWith<$Res>? get message {
    if (_value.message == null) {
      return null;
    }

    return $GPTMessageCopyWith<$Res>(_value.message!, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DeltaCopyWith<$Res>? get delta {
    if (_value.delta == null) {
      return null;
    }

    return $DeltaCopyWith<$Res>(_value.delta!, (value) {
      return _then(_value.copyWith(delta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChoicesCopyWith<$Res> implements $ChoicesCopyWith<$Res> {
  factory _$$_ChoicesCopyWith(
          _$_Choices value, $Res Function(_$_Choices) then) =
      __$$_ChoicesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GPTMessage? message, String? finishReason, int? index, Delta? delta});

  @override
  $GPTMessageCopyWith<$Res>? get message;
  @override
  $DeltaCopyWith<$Res>? get delta;
}

/// @nodoc
class __$$_ChoicesCopyWithImpl<$Res>
    extends _$ChoicesCopyWithImpl<$Res, _$_Choices>
    implements _$$_ChoicesCopyWith<$Res> {
  __$$_ChoicesCopyWithImpl(_$_Choices _value, $Res Function(_$_Choices) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? finishReason = freezed,
    Object? index = freezed,
    Object? delta = freezed,
  }) {
    return _then(_$_Choices(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as GPTMessage?,
      finishReason: freezed == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      delta: freezed == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Delta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Choices implements _Choices {
  _$_Choices({this.message, this.finishReason, this.index, this.delta});

  factory _$_Choices.fromJson(Map<String, dynamic> json) =>
      _$$_ChoicesFromJson(json);

  @override
  final GPTMessage? message;
  @override
  final String? finishReason;
  @override
  final int? index;
  @override
  final Delta? delta;

  @override
  String toString() {
    return 'Choices(message: $message, finishReason: $finishReason, index: $index, delta: $delta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Choices &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, finishReason, index, delta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChoicesCopyWith<_$_Choices> get copyWith =>
      __$$_ChoicesCopyWithImpl<_$_Choices>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChoicesToJson(
      this,
    );
  }
}

abstract class _Choices implements Choices {
  factory _Choices(
      {final GPTMessage? message,
      final String? finishReason,
      final int? index,
      final Delta? delta}) = _$_Choices;

  factory _Choices.fromJson(Map<String, dynamic> json) = _$_Choices.fromJson;

  @override
  GPTMessage? get message;
  @override
  String? get finishReason;
  @override
  int? get index;
  @override
  Delta? get delta;
  @override
  @JsonKey(ignore: true)
  _$$_ChoicesCopyWith<_$_Choices> get copyWith =>
      throw _privateConstructorUsedError;
}

GPTMessage _$GPTMessageFromJson(Map<String, dynamic> json) {
  return _GPTMessage.fromJson(json);
}

/// @nodoc
mixin _$GPTMessage {
  String? get role => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GPTMessageCopyWith<GPTMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GPTMessageCopyWith<$Res> {
  factory $GPTMessageCopyWith(
          GPTMessage value, $Res Function(GPTMessage) then) =
      _$GPTMessageCopyWithImpl<$Res, GPTMessage>;
  @useResult
  $Res call({String? role, String? content});
}

/// @nodoc
class _$GPTMessageCopyWithImpl<$Res, $Val extends GPTMessage>
    implements $GPTMessageCopyWith<$Res> {
  _$GPTMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GPTMessageCopyWith<$Res>
    implements $GPTMessageCopyWith<$Res> {
  factory _$$_GPTMessageCopyWith(
          _$_GPTMessage value, $Res Function(_$_GPTMessage) then) =
      __$$_GPTMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? role, String? content});
}

/// @nodoc
class __$$_GPTMessageCopyWithImpl<$Res>
    extends _$GPTMessageCopyWithImpl<$Res, _$_GPTMessage>
    implements _$$_GPTMessageCopyWith<$Res> {
  __$$_GPTMessageCopyWithImpl(
      _$_GPTMessage _value, $Res Function(_$_GPTMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_GPTMessage(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GPTMessage implements _GPTMessage {
  _$_GPTMessage({this.role, this.content});

  factory _$_GPTMessage.fromJson(Map<String, dynamic> json) =>
      _$$_GPTMessageFromJson(json);

  @override
  final String? role;
  @override
  final String? content;

  @override
  String toString() {
    return 'GPTMessage(role: $role, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GPTMessage &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GPTMessageCopyWith<_$_GPTMessage> get copyWith =>
      __$$_GPTMessageCopyWithImpl<_$_GPTMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GPTMessageToJson(
      this,
    );
  }
}

abstract class _GPTMessage implements GPTMessage {
  factory _GPTMessage({final String? role, final String? content}) =
      _$_GPTMessage;

  factory _GPTMessage.fromJson(Map<String, dynamic> json) =
      _$_GPTMessage.fromJson;

  @override
  String? get role;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_GPTMessageCopyWith<_$_GPTMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

Delta _$DeltaFromJson(Map<String, dynamic> json) {
  return _Delta.fromJson(json);
}

/// @nodoc
mixin _$Delta {
  String? get content => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeltaCopyWith<Delta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeltaCopyWith<$Res> {
  factory $DeltaCopyWith(Delta value, $Res Function(Delta) then) =
      _$DeltaCopyWithImpl<$Res, Delta>;
  @useResult
  $Res call({String? content, String? role});
}

/// @nodoc
class _$DeltaCopyWithImpl<$Res, $Val extends Delta>
    implements $DeltaCopyWith<$Res> {
  _$DeltaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeltaCopyWith<$Res> implements $DeltaCopyWith<$Res> {
  factory _$$_DeltaCopyWith(_$_Delta value, $Res Function(_$_Delta) then) =
      __$$_DeltaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? content, String? role});
}

/// @nodoc
class __$$_DeltaCopyWithImpl<$Res> extends _$DeltaCopyWithImpl<$Res, _$_Delta>
    implements _$$_DeltaCopyWith<$Res> {
  __$$_DeltaCopyWithImpl(_$_Delta _value, $Res Function(_$_Delta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? role = freezed,
  }) {
    return _then(_$_Delta(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Delta implements _Delta {
  _$_Delta({this.content, this.role});

  factory _$_Delta.fromJson(Map<String, dynamic> json) =>
      _$$_DeltaFromJson(json);

  @override
  final String? content;
  @override
  final String? role;

  @override
  String toString() {
    return 'Delta(content: $content, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delta &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeltaCopyWith<_$_Delta> get copyWith =>
      __$$_DeltaCopyWithImpl<_$_Delta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeltaToJson(
      this,
    );
  }
}

abstract class _Delta implements Delta {
  factory _Delta({final String? content, final String? role}) = _$_Delta;

  factory _Delta.fromJson(Map<String, dynamic> json) = _$_Delta.fromJson;

  @override
  String? get content;
  @override
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$_DeltaCopyWith<_$_Delta> get copyWith =>
      throw _privateConstructorUsedError;
}
