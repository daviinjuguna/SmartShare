// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveUserModel _$SaveUserModelFromJson(Map<String, dynamic> json) {
  return SaveUserModel(
    success: json['success'] as bool,
    imageUrl: json['photo'] as String,
  );
}

Map<String, dynamic> _$SaveUserModelToJson(SaveUserModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'photo': instance.imageUrl,
    };
