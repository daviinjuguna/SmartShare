import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GetPost extends Equatable{
  GetPost({
    @required this.id,
    @required this.userId,
    @required this.desc,
    @required this.photo,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.commentsCount,
    @required this.likesCount,
    @required this.selfLike,
    @required this.user,
    @required this.comments,
    @required this.likes});

  @override
  List<Object> get props => [
    id,userId,desc,photo,
    createdAt,updatedAt,likesCount,selfLike,user,
    comments,likes
  ];

  final int id;
  final int userId;
  final String desc;
  final String photo;
  final String createdAt;
  final String updatedAt;
  final int commentsCount;
  final int likesCount;
  final bool selfLike;
  final User user;
  final List<Comments> comments;
  final List<Likes> likes;
}