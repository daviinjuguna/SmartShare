import 'dart:convert';

import 'package:SmartShare/database/comments/comments_dao.dart';
import 'package:SmartShare/database/smart_share_database.dart';
import 'package:SmartShare/features/data/model/comments/comments_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class CommentLocalDataSource {
  Future<void> cacheComments(List<CommentsModel> comment);
  Future<List<CommentsModel>> getCachedComments();
}

@LazySingleton(as: CommentLocalDataSource)
class CommentLocalDataSourceImpl implements CommentLocalDataSource {
  final CommentDao dao;

  CommentLocalDataSourceImpl({@required this.dao});
  @override
  Future<void> cacheComments(List<CommentsModel> comment) async {
    await dao.deleteAll();
    for (var i = 0; i < comment.length; i++) {
      try {
        CommentsModel e = comment[i];
        await dao.insertComment(CommentsDataClass(
            id: e.id,
            userId: e.userId,
            postId: e.postId,
            comment: e.comment,
            createdAt: e.createdAt,
            updatedAt: e.updatedAt,
            user: jsonEncode(e.user)));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Future<List<CommentsModel>> getCachedComments() async {
    List<CommentsDataClass> commentData = await dao.getComments();
    List<CommentsModel> model = [];
    for (var i = 0; i < model.length; i++) {
      CommentsDataClass e = commentData[i];
      model.add(CommentsModel(
          id: e.id,
          userId: e.userId,
          postId: e.postId,
          comment: e.comment,
          createdAt: e.createdAt,
          updatedAt: e.updatedAt,
          user: jsonDecode(e.user)));
    }
    return model;
  }
}
