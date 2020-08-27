import 'package:json_annotation/json_annotation.dart';

part 'access_token_model.g.dart';

@JsonSerializable()
class AccessTokenModel {

  @JsonKey(name:"token_type")
  String tokenType;
  @JsonKey(name:"expires_in")
  int expiresIn;
  @JsonKey(name:"access_token")
  String accessToken;
  @JsonKey(name:"refresh_token")
  String refreshToken;

  AccessTokenModel(
    {this.tokenType, this.expiresIn, this.accessToken, this.refreshToken});

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenModelToJson(this);

}