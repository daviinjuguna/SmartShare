// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    name: json['name'] as String,
    lastName: json['last_name'] as String,
    photo: json['photo'] as String,
    email: json['email'] as String,
    emailVerifiedAt: json['email_verified_at'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    pin: json['pin'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
      'photo': instance.photo,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pin': instance.pin,
    };