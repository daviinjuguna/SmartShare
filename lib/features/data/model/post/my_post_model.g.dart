// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPostModel _$MyPostModelFromJson(Map<String, dynamic> json) {
  return MyPostModel(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    desc: json['desc'] as String,
    photo: json['photo'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$MyPostModelToJson(MyPostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'desc': instance.desc,
      'photo': instance.photo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
