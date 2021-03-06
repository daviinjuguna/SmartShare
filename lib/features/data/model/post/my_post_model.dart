import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';

class MyPostModel extends GetMyPost{
  List<Post> post;
  User user;

  MyPostModel({this.post, this.user}):super(post: post,user: user);

  @override
  List<Object> get props => [post,user];

  MyPostModel.fromJson(Map<String, dynamic> json) {
    if (json['post'] != null) {
      post = new List<Post>();
      json['post'].forEach((v) {
        post.add(new Post.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Post {
  int id;
  int userId;
  String desc;
  String photo;
  String createdAt;
  String updatedAt;

  Post(
      {this.id,
        this.userId,
        this.desc,
        this.photo,
        this.createdAt,
        this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    desc = json['desc'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['desc'] = this.desc;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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