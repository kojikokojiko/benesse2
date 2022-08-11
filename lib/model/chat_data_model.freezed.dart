// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatData _$ChatDataFromJson(Map<String, dynamic> json) {
  return _ChatData.fromJson(json);
}

/// @nodoc
mixin _$ChatData {
  String get content => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  @CreatedAtField()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDataCopyWith<ChatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDataCopyWith<$Res> {
  factory $ChatDataCopyWith(ChatData value, $Res Function(ChatData) then) =
      _$ChatDataCopyWithImpl<$Res>;
  $Res call(
      {String content,
      String userId,
      String name,
      String imageUrl,
      @CreatedAtField() DateTime? createdAt});
}

/// @nodoc
class _$ChatDataCopyWithImpl<$Res> implements $ChatDataCopyWith<$Res> {
  _$ChatDataCopyWithImpl(this._value, this._then);

  final ChatData _value;
  // ignore: unused_field
  final $Res Function(ChatData) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_ChatDataCopyWith<$Res> implements $ChatDataCopyWith<$Res> {
  factory _$$_ChatDataCopyWith(
          _$_ChatData value, $Res Function(_$_ChatData) then) =
      __$$_ChatDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String content,
      String userId,
      String name,
      String imageUrl,
      @CreatedAtField() DateTime? createdAt});
}

/// @nodoc
class __$$_ChatDataCopyWithImpl<$Res> extends _$ChatDataCopyWithImpl<$Res>
    implements _$$_ChatDataCopyWith<$Res> {
  __$$_ChatDataCopyWithImpl(
      _$_ChatData _value, $Res Function(_$_ChatData) _then)
      : super(_value, (v) => _then(v as _$_ChatData));

  @override
  _$_ChatData get _value => super._value as _$_ChatData;

  @override
  $Res call({
    Object? content = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ChatData(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatData implements _ChatData {
  const _$_ChatData(
      {this.content = "",
      this.userId = "",
      this.name = "",
      this.imageUrl = "",
      @CreatedAtField() this.createdAt});

  factory _$_ChatData.fromJson(Map<String, dynamic> json) =>
      _$$_ChatDataFromJson(json);

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @CreatedAtField()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ChatData(content: $content, userId: $userId, name: $name, imageUrl: $imageUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatData &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_ChatDataCopyWith<_$_ChatData> get copyWith =>
      __$$_ChatDataCopyWithImpl<_$_ChatData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatDataToJson(
      this,
    );
  }
}

abstract class _ChatData implements ChatData {
  const factory _ChatData(
      {final String content,
      final String userId,
      final String name,
      final String imageUrl,
      @CreatedAtField() final DateTime? createdAt}) = _$_ChatData;

  factory _ChatData.fromJson(Map<String, dynamic> json) = _$_ChatData.fromJson;

  @override
  String get content;
  @override
  String get userId;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  @CreatedAtField()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChatDataCopyWith<_$_ChatData> get copyWith =>
      throw _privateConstructorUsedError;
}
