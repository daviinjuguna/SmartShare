import 'dart:convert';

import 'package:SmartShare/database/my_post/my_post_dao.dart';
import 'package:SmartShare/database/post/post_dao.dart';
import 'package:SmartShare/database/smart_share_database.dart';
import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:SmartShare/features/data/model/post/my_post_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class PostLocalDataSource {
  Future<void> cachePost(List<GetPostModel> getPostModel);
  Future<List<GetPostModel>> getCachedPost();
  Future<void> cacheMyPost(MyPostModel myPostModel);
  Future<List<MyPostModel>> getCachedMyPost();
}

@LazySingleton(as: PostLocalDataSource)
class PostLocalDataSourceImpl implements PostLocalDataSource {
  final PostDao dao;
  final MyPostDao myDao;

  PostLocalDataSourceImpl({@required this.dao, @required this.myDao});

  @override
  Future<void> cachePost(List<GetPostModel> getPostModel) async {
    await dao.deleteAll();
    for (var i = 0; i < getPostModel.length; i++) {
      try {
        GetPostModel e = getPostModel[i];
        await dao.insertPost(PostTable(
            id: e.id,
            userId: e.userId,
            desc: e.desc,
            photo: e.photo,
            createdAt: e.createdAt,
            updatedAt: e.updatedAt,
            commentsCount: e.commentsCount,
            likesCount: e.likesCount,
            selfLike: e.selfLike,
            user: jsonEncode(e.user),
            comments: jsonEncode(e.comments),
            likes: jsonEncode(e.likes)));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Future<List<GetPostModel>> getCachedPost() async {
    List<PostTable> postData = await dao.getPosts();
    List<GetPostModel> model = [];
    for (var i = 0; i < model.length; i++) {
      PostTable e = postData[i];
      model.add(GetPostModel(
          id: e.id,
          userId: e.userId,
          desc: e.desc,
          photo: e.photo,
          createdAt: e.createdAt,
          updatedAt: e.updatedAt,
          commentsCount: e.commentsCount,
          likesCount: e.likesCount,
          selfLike: e.selfLike,
          user: jsonDecode(e.user),
          comments: jsonDecode(e.comments),
          likes: jsonDecode(e.likes)));
    }
    return model;
  }

  @override
  Future<void> cacheMyPost(MyPostModel model) async {
    await myDao.deleteAll();
    try {
      MyPost myPost =
          MyPost(post: jsonEncode(model.post), user: jsonEncode(model.user));

      return await myDao.insertMyPost(myPost);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<MyPostModel>> getCachedMyPost() async {
    List<MyPost> postData = await myDao.getMyPosts();
    List<MyPostModel> model = [];
    for (var i = 0; i < model.length; i++) {
      MyPost e = postData[i];
      model
          .add(MyPostModel(post: jsonDecode(e.post), user: jsonDecode(e.user)));
    }
    return model;
  }
}
