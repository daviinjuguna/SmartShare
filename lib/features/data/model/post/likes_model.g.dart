// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikesModel _$LikesModelFromJson(Map<String, dynamic> json) {
  return LikesModel(
    id: json['id'] as int,
    postId: json['post_id'] as int,
    userId: json['user_id'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$LikesModelToJson(LikesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
