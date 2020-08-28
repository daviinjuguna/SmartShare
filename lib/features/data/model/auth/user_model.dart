import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String name;
  @JsonKey(name: "last_name")
  String lastName;
  String photo;
  String email;
  @JsonKey(name:'email_verified_at')
  String emailVerifiedAt;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  String pin;

  UserModel(
      {this.id,
      this.name,
      this.lastName,
      this.photo,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.pin});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}