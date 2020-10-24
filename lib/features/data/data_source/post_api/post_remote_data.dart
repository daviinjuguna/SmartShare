import 'dart:io';

import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/features/data/data_source/post_api/post_client.dart';
import 'package:SmartShare/features/data/model/auth/access_token_model.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:SmartShare/features/data/model/post/my_post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

abstract class PostRemoteData {
  Future<List<GetPostModel>> getPost(AccessTokenModel model);
  Future<GetPostModel>createUserPost(AccessTokenModel model,String postDescription,String imageUrl);
  Future<ApiSuccessModel>editPost(AccessTokenModel model,int postId,String postDescription);
  Future<ApiSuccessModel>deletePost(AccessTokenModel model,int postId,);
  Future<ApiSuccessModel>likePost(AccessTokenModel model,int postId,);
  Future<MyPostModel>getMyPost(AccessTokenModel model);
}

@LazySingleton(as: PostRemoteData)
class PostRemoteDataImpl implements PostRemoteData {
  final PostClient client;

  PostRemoteDataImpl({@required this.client});

  @override
  Future<List<GetPostModel>> getPost(AccessTokenModel model) async{
    final response =  await client.getPost('Bearer ${model.accessToken}');
    if (response.statusCode == 200) {
      List<GetPostModel> model = [];
      try {
        model = (response.body as List)
        .map((e) => GetPostModel.fromJson(e))
        .toList();
      } catch (e) {
        print(e.toString());  
      }
      return model;
    }else if (response.statusCode == 401){
      throw UnAuthenticatedException();
    }else{
      throw ServerException();
    }
  }

  @override
  Future<GetPostModel> createUserPost(AccessTokenModel model,String postDescription,String imageUrl,) async{
    final response =  await client.createUserPost('Bearer ${model.accessToken}',postDescription,imageUrl);
    if (response.statusCode == 200) {
      var results = GetPostModel.fromJson(response.body);
      return results;
    } else if(response.statusCode == 401){
      throw UnAuthenticatedException();
    }else{
      throw ServerException();
    }
  }

  @override
  Future<ApiSuccessModel> editPost(AccessTokenModel model, int postId, String postDescription) async{
    final response =  await client.editPosts('Bearer ${model.accessToken}',postId,postDescription);
    if (response.statusCode == 200) {
      var results = ApiSuccessModel.fromJson(response.body);
      return results;
    } else if(response.statusCode == 401){
      throw UnAuthenticatedException();
    }else{
      throw ServerException();
    }
  }

  @override
  Future<ApiSuccessModel> deletePost(AccessTokenModel model, int postId) async{
    final response =  await client.deletePosts('Bearer ${model.accessToken}',postId,);
    if (response.statusCode == 200) {
      var results = ApiSuccessModel.fromJson(response.body);
      return results;
    } else if(response.statusCode == 401){
      throw UnAuthenticatedException();
    }else{
      throw ServerException();
    }
  }

  @override
  Future<ApiSuccessModel> likePost(AccessTokenModel model, int postId) async{
    final response =  await client.likePost('Bearer ${model.accessToken}',postId,);
    if (response.statusCode == 200) {
      var results = ApiSuccessModel.fromJson(response.body);
      return results;
    } else if(response.statusCode == 401){
      throw UnAuthenticatedException();
    }else{
      throw ServerException();
    }
  }

  @override
  Future<MyPostModel> getMyPost(AccessTokenModel model) async{
     final response =  await client.getMyPost('Bearer ${model.accessToken}');
    if (response.statusCode == 200) {
      var results = MyPostModel.fromJson(response.body);
      return results;
    } else if(response.statusCode == 401){
      throw UnAuthenticatedException();
    }else{
      throw ServerException();
    }
  }
}