import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/features/data/data_source/comments_api/comments_client.dart';
import 'package:SmartShare/features/data/model/auth/access_token_model.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:SmartShare/features/data/model/comments/comments_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

abstract class CommentsRemoteDataSource {
  Future<CommentsModel> createComments(
    AccessTokenModel model,
    int postId,
    String comments
  );
  Future<List<CommentsModel>> getComments(AccessTokenModel model, int postId);
  Future<ApiSuccessModel> editComments(
    AccessTokenModel model,
    int commentId,
    String comments
  );
  Future<ApiSuccessModel> deleteComments(AccessTokenModel model,int commentId);
}

@LazySingleton(as: CommentsRemoteDataSource)
class CommentsRemoteDataSourceImpl implements CommentsRemoteDataSource{
  final CommentClient client;

  CommentsRemoteDataSourceImpl({@required this.client});

  @override
  Future<CommentsModel> createComments(AccessTokenModel model, int postId, String comments) async{
    final response = await client.createComments('Bearer ${model.accessToken}', postId, comments);
    if (response.statusCode == 200) {
      var results = CommentsModel.fromJson(response.body);
      return results;
    } else if(response.statusCode == 401){
      throw UnAuthenticatedException();
    }else{
      throw ServerException();
    }
  }

  @override
  Future<List<CommentsModel>> getComments(AccessTokenModel model, int postId) async{
    final response = await client.getComments('Bearer ${model.accessToken}', postId);
    if (response.statusCode == 200) {
      List<CommentsModel> model = [];
      try {
        model = (response.body as List)
        .map((e) => CommentsModel.fromJson(e))
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
  Future<ApiSuccessModel> editComments(AccessTokenModel model, int commentId, String comments) async{
    final response = await client.editComments('Bearer ${model.accessToken}', commentId, comments);
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
  Future<ApiSuccessModel> deleteComments(AccessTokenModel model, int commentId) async{
    final response = await client.deleteComments('Bearer ${model.accessToken}', commentId);
    if (response.statusCode == 200) {
      var results = ApiSuccessModel.fromJson(response.body);
      return results;
    } else if(response.statusCode == 401){
      throw UnAuthenticatedException();
    }else{
      throw ServerException();
    }
  }

}