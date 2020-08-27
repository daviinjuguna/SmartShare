import 'dart:convert';

import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/features/data/model/auth/access_token_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource{
  Future<void> cacheAuthToken(AccessTokenModel model);
  Future<AccessTokenModel> getAuthToken();
  Future<void> deleteCachedToken();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource{

  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheAuthToken(AccessTokenModel model) {
    try {
      var acessToken = sharedPreferences.setString("access_token", 
      json.encode(model));
      // print(acessToken);
      return acessToken;
    } catch (e) {
      throw CacheException();
    }
  }
  
  @override
  Future<AccessTokenModel> getAuthToken(){
    String accessToken = sharedPreferences.getString("access_token");
    if (accessToken != null){
      // print(accessToken);
      return Future.value(AccessTokenModel.fromJson(json.decode(accessToken)));
    }else{
      return null;
    }
  }

  @override
  Future<void> deleteCachedToken() {
    String accessToken = sharedPreferences.getString("access_token");
    if (accessToken != null){
      return sharedPreferences.clear();
    }else{
      return null;
    }
  }  
}