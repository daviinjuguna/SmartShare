import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/features/data/data_source/post_api/post_client.dart';
import 'package:SmartShare/features/data/model/auth/access_token_model.dart';
import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:SmartShare/features/data/model/post/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

abstract class PostRemoteData {
  Future<List<GetPostModel>> getPost(AccessTokenModel model);
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
  
}