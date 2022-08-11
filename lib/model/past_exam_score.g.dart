// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'past_exam_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PastExamScore _$$_PastExamScoreFromJson(Map<String, dynamic> json) =>
    _$_PastExamScore(
      score: json['score'] as int? ?? 0,
      userId: json['userId'] as String? ?? "",
      name: json['name'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
    );

Map<String, dynamic> _$$_PastExamScoreToJson(_$_PastExamScore instance) =>
    <String, dynamic>{
      'score': instance.score,
      'userId': instance.userId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
