import 'package:SmartShare/features/data/model/comments/comments_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class GetComments extends Equatable{
  GetComments({
    @required this.id,
    @required this.userId,
    @required this.postId,
    @required this.comment,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.user});

  @override
  List<Object> get props => [id,userId,postId,comment,createdAt,updatedAt,user];

  final int id;
  final int userId;
  final int postId;
  final String comment;
  final String createdAt;
  final String updatedAt;
  final User user;

}