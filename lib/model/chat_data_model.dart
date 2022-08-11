import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_data_model.freezed.dart';
part 'chat_data_model.g.dart';

@freezed
class ChatData with _$ChatData {
  const factory ChatData({
    @Default("") String  content,
    @Default("") String userId,
    @Default("") String name,
    @Default("") String imageUrl,
    @CreatedAtField() DateTime? createdAt,

  }) = _ChatData;

  factory ChatData.fromJson(Map<String, Object?> json)
  => _$ChatDataFromJson(json);
}


// プロパティにつけると変換時、必ず FieldValue.serverTimestamp() に変換される
// これにより、updatedAt の挙動になる
class UpdatedAtField implements JsonConverter<DateTime?, dynamic> {
  const UpdatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  @override
  FieldValue toJson(DateTime? date) {
    return FieldValue.serverTimestamp();
  }
}

class CreatedAtField implements JsonConverter<DateTime?, dynamic> {
  const CreatedAtField();

  @override
  DateTime? fromJson(dynamic timestamp) {
    timestamp as Timestamp?;
    return timestamp?.toDate();
  }

  // nullの時は toJson 時 FieldValue.serverTimestamp() を返すことで、createdAt の挙動になる
  @override
  dynamic toJson(DateTime? dateTime) {
    if (dateTime == null) return FieldValue.serverTimestamp();
    return dateTime;
  }
}