import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_user_model.g.dart';

@JsonSerializable()
class SaveUserModel{
  final bool success;
  @JsonKey(name: "photo")
  final String imageUrl;

  SaveUserModel({@required this.success,this.imageUrl});
  

  factory SaveUserModel.fromJson(Map<String, dynamic> json) =>
      _$SaveUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$SaveUserModelToJson(this);
}