import 'package:json_annotation/json_annotation.dart';

part 'likes_model.g.dart';

@JsonSerializable()
class LikesModel {
  int id;
  @JsonKey(name: "post_id")
  int postId;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;

  LikesModel({this.id, this.postId, this.userId, this.createdAt, this.updatedAt});

  factory LikesModel.fromJson(Map<String, dynamic> json) =>
      _$LikesModelFromJson(json);

  Map<String, dynamic> toJson() => _$LikesModelToJson(this);
}