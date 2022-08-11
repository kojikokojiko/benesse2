// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatData _$$_ChatDataFromJson(Map<String, dynamic> json) => _$_ChatData(
      content: json['content'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      name: json['name'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      createdAt: const CreatedAtField().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_ChatDataToJson(_$_ChatData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'userId': instance.userId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'createdAt': const CreatedAtField().toJson(instance.createdAt),
    };
