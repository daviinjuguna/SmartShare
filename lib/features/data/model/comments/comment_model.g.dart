// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
    userId: json['user_id'] as int,
    postId: json['post_id'] as String,
    comment: json['comment'] as String,
    updatedAt: json['updated_at'] as String,
    createdAt: json['created_at'] as String,
    id: json['id'] as int,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'post_id': instance.postId,
      'comment': instance.comment,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'user': instance.user,
    };
