import 'package:SmartShare/features/domain/entities/home/get_comment.dart';

class CommentsModel extends GetComments{
  int id;
  int userId;
  int postId;
  String comment;
  String createdAt;
  String updatedAt;
  User user;

  CommentsModel(
      {this.id,
        this.userId,
        this.postId,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.user}):
      super(
        id: id,
        userId: userId,
        postId: postId,
        comment: comment,
        createdAt: createdAt,
        updatedAt: updatedAt,
        user: user
      );

  @override
  List<Object> get props => [id,userId,postId,comment,createdAt,updatedAt,user];

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String lastName;
  String photo;
  String email;
  Null emailVerifiedAt;
  String createdAt;
  String updatedAt;
  int pin;

  User(
      {this.id,
        this.name,
        this.lastName,
        this.photo,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.pin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    photo = json['photo'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['pin'] = this.pin;
    return data;
  }
}