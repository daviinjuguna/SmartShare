import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_success_model.g.dart';

@JsonSerializable()
class ApiSuccessModel{
  final bool success;
  final String message;

  ApiSuccessModel({@required this.success, @required this.message});
  

  factory ApiSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$ApiSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSuccessModelToJson(this);
}