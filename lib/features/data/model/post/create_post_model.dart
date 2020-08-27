class CreatePostModel {
  bool success;
  String message;
  Post post;

  CreatePostModel({this.success, this.message, this.post});

  CreatePostModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.post != null) {
      data['post'] = this.post.toJson();
    }
    return data;
  }
}

class Post {
  int userId;
  String desc;
  String photo;
  String updatedAt;
  String createdAt;
  int id;
  User user;

  Post(
      {this.userId,
      this.desc,
      this.photo,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.user});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    desc = json['desc'];
    photo = json['photo'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['desc'] = this.desc;
    data['photo'] = this.photo;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
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

  User(
      {this.id,
      this.name,
      this.lastName,
      this.photo,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    photo = json['photo'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}