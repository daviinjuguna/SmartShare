import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_success_model.g.dart';

@JsonSerializable()
class ApiSuccessModel extends ApiSuccess{
  final bool success;
  final String message;

  ApiSuccessModel({@required this.success, @required this.message})
      : super(message: message, success: success);
  

  factory ApiSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSuccessModelToJson(this);
}