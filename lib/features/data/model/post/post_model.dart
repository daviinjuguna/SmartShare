import 'package:SmartShare/features/data/model/auth/user_model.dart';
import 'package:SmartShare/features/data/model/comments/comment_model.dart';
import 'package:SmartShare/features/data/model/post/likes_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  int id;
  @JsonKey(name: "user_id")
  int userId;
  String desc;
  String photo;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  int commentsCount;
  int likesCount;
  bool selfLike;
  UserModel user;
  List<CommentModel> comments;
  List<LikesModel> likes;

  PostModel(
      {this.id,
      this.userId,
      this.desc,
      this.photo,
      this.createdAt,
      this.updatedAt,
      this.commentsCount,
      this.likesCount,
      this.selfLike,
      this.user,
      this.comments,
      this.likes});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
