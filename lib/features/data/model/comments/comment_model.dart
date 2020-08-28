import 'package:SmartShare/features/data/model/auth/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "post_id")
  String postId;
  String comment;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "created_at")
  String createdAt;
  int id;
  UserModel user;

  CommentModel(
      {this.userId,
      this.postId,
      this.comment,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.user});

   factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}