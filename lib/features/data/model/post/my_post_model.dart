import 'package:json_annotation/json_annotation.dart';

part 'my_post_model.g.dart';

@JsonSerializable()
class MyPostModel {
  int id;
  @JsonKey(name: "user_id")
  int userId;
  String desc;
  String photo;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;

  MyPostModel(
      {this.id,
      this.userId,
      this.desc,
      this.photo,
      this.createdAt,
      this.updatedAt});


  factory MyPostModel.fromJson(Map<String, dynamic> json) =>
      _$MyPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyPostModelToJson(this);
}