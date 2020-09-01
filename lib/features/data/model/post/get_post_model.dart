class GetPostModel {
  int id;
  int userId;
  String desc;
  String photo;
  String createdAt;
  String updatedAt;
  int commentsCount;
  int likesCount;
  bool selfLike;
  User user;
  List<Comments> comments;
  List<Likes> likes;

  GetPostModel(
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

  GetPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    desc = json['desc'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    commentsCount = json['comments_count'];
    likesCount = json['likes_count'];
    selfLike = json['self_like'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = new List<Likes>();
      json['likes'].forEach((v) {
        likes.add(new Likes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['desc'] = this.desc;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['comments_count'] = this.commentsCount;
    data['likes_count'] = this.likesCount;
    data['self_like'] = this.selfLike;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    if (this.likes != null) {
      data['likes'] = this.likes.map((v) => v.toJson()).toList();
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
  Null pin;

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

class Comments {
  int id;
  int userId;
  int postId;
  String comment;
  String createdAt;
  String updatedAt;

  Comments(
      {this.id,
      this.userId,
      this.postId,
      this.comment,
      this.createdAt,
      this.updatedAt});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Likes {
  int id;
  int postId;
  int userId;
  String createdAt;
  String updatedAt;

  Likes({this.id, this.postId, this.userId, this.createdAt, this.updatedAt});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}