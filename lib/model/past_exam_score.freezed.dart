// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'past_exam_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PastExamScore _$PastExamScoreFromJson(Map<String, dynamic> json) {
  return _PastExamScore.fromJson(json);
}

/// @nodoc
mixin _$PastExamScore {
  int get score => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PastExamScoreCopyWith<PastExamScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PastExamScoreCopyWith<$Res> {
  factory $PastExamScoreCopyWith(
          PastExamScore value, $Res Function(PastExamScore) then) =
      _$PastExamScoreCopyWithImpl<$Res>;
  $Res call({int score, String userId, String name, String imageUrl});
}

/// @nodoc
class _$PastExamScoreCopyWithImpl<$Res>
    implements $PastExamScoreCopyWith<$Res> {
  _$PastExamScoreCopyWithImpl(this._value, this._then);

  final PastExamScore _value;
  // ignore: unused_field
  final $Res Function(PastExamScore) _then;

  @override
  $Res call({
    Object? score = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// @nodoc
abstract class _$$_PastExamScoreCopyWith<$Res>
    implements $PastExamScoreCopyWith<$Res> {
  factory _$$_PastExamScoreCopyWith(
          _$_PastExamScore value, $Res Function(_$_PastExamScore) then) =
      __$$_PastExamScoreCopyWithImpl<$Res>;
  @override
  $Res call({int score, String userId, String name, String imageUrl});
}

/// @nodoc
class __$$_PastExamScoreCopyWithImpl<$Res>
    extends _$PastExamScoreCopyWithImpl<$Res>
    implements _$$_PastExamScoreCopyWith<$Res> {
  __$$_PastExamScoreCopyWithImpl(
      _$_PastExamScore _value, $Res Function(_$_PastExamScore) _then)
      : super(_value, (v) => _then(v as _$_PastExamScore));

  @override
  _$_PastExamScore get _value => super._value as _$_PastExamScore;

  @override
  $Res call({
    Object? score = freezed,
    Object? userId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_PastExamScore(
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PastExamScore implements _PastExamScore {
  const _$_PastExamScore(
      {this.score = 0, this.userId = "", this.name = "", this.imageUrl = ""});

  factory _$_PastExamScore.fromJson(Map<String, dynamic> json) =>
      _$$_PastExamScoreFromJson(json);

  @override
  @JsonKey()
  final int score;
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
  String toString() {
    return 'PastExamScore(score: $score, userId: $userId, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PastExamScore &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$$_PastExamScoreCopyWith<_$_PastExamScore> get copyWith =>
      __$$_PastExamScoreCopyWithImpl<_$_PastExamScore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PastExamScoreToJson(
      this,
    );
  }
}

abstract class _PastExamScore implements PastExamScore {
  const factory _PastExamScore(
      {final int score,
      final String userId,
      final String name,
      final String imageUrl}) = _$_PastExamScore;

  factory _PastExamScore.fromJson(Map<String, dynamic> json) =
      _$_PastExamScore.fromJson;

  @override
  int get score;
  @override
  String get userId;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PastExamScoreCopyWith<_$_PastExamScore> get copyWith =>
      throw _privateConstructorUsedError;
}
