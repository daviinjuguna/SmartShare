import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/features/data/data_source/auth_api/rest_client.dart';
import 'package:SmartShare/features/data/model/auth/access_token_model.dart';
import 'package:SmartShare/features/data/model/auth/save_user_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource{
  Future<AccessTokenModel> loginUser(String email,String password);
  Future<AccessTokenModel> registerUser(
    String email,
    String password,
    String passwordConfirmation);
  Future<void>logout(AccessTokenModel model);
  Future<AccessTokenModel> refreshToken(AccessTokenModel model);
  Future<SaveUserModel>saveUserInfo(
    AccessTokenModel model,
    String firstName,
    String lastName,
    String imageUrl
  );
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final AuthClient client;

  AuthRemoteDataSourceImpl({@required this.client});
  
  @override
  Future<AccessTokenModel> loginUser(String email, String password) async{
     final response = await client.loginUser(email, password);
    if (response.statusCode == 200) {
      return AccessTokenModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AccessTokenModel> registerUser(String email, String password, String passwordConfirmation) async{
    final response = await client.registerUser( email, password, passwordConfirmation);
    if (response.statusCode == 200) {
      return AccessTokenModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> logout(AccessTokenModel model)async{
  final response = await client.logout('Bearer ${model.accessToken}');
   if (response.statusCode == 204) {//void,no content response
      return "Logout Success";
    }else if (response.statusCode == 401) {
      throw UnAuthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AccessTokenModel> refreshToken(AccessTokenModel model) async{
     final response = await client.refreshToken(model.refreshToken);
    if (response.statusCode == 200) {
      return AccessTokenModel.fromJson(response.body);
    }else if (response.statusCode == 401) {
      throw UnAuthenticatedException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SaveUserModel> saveUserInfo(AccessTokenModel model, String firstName, String lastName, String imageUrl) async{
    final response = await client.saveUserInfo('Bearer ${model.accessToken}', firstName, lastName, imageUrl);
    if (response.statusCode == 200) {
      return SaveUserModel.fromJson(response.body);
    }else if (response.statusCode == 401) {
      throw UnAuthenticatedException();
    } else {
      throw ServerException();
    }
  }
}