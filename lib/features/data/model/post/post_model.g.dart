// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return PostModel(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    desc: json['desc'] as String,
    photo: json['photo'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    commentsCount: json['comments_count'] as int,
    likesCount: json['likes_count'] as int,
    selfLike: json['self_like'] as bool,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    comments: (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : CommentModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    likes: (json['likes'] as List)
        ?.map((e) =>
            e == null ? null : LikesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'desc': instance.desc,
      'photo': instance.photo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'comments_count': instance.commentsCount,
      'likes_count': instance.likesCount,
      'self_like': instance.selfLike,
      'user': instance.user,
      'comments': instance.comments,
      'likes': instance.likes,
    };
