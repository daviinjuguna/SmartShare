import 'dart:io';

import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/network_info.dart';
import 'package:SmartShare/features/data/data_source/auth_api/auth_local_data.dart';
import 'package:SmartShare/features/data/data_source/post_api/post_remote_data.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final AuthLocalDataSource localDataSource;
  final PostRemoteData remoteDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required this.networkInfo
  });

  @override
  Future<Either<Failure, List<GetPost>>> getPost() async{
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try{
          final post = await remoteDataSource.getPost(await accessToken);
          return Right(post);
        } on ServerException {
          print("server exception");
          return Left(ServerFailure());
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        } on CacheException {
          return Left(CacheFailure());
        }
      } else {
        return Left(ServerFailure());
      }
      
    }else{
      return Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> createUserPost(String postDescription, String imageUrl) async{
      final accessToken = localDataSource.getAuthToken();
      if (accessToken != null) {
        if (await networkInfo.isConnected) {
          try{
            await remoteDataSource.createUserPost(await accessToken, postDescription, imageUrl);
            ApiSuccessModel apiSuccessModel = new ApiSuccessModel(success: true, message: "Created");
            return Right(apiSuccessModel);
          }on ServerException {
          print("server exception");
          return Left(ServerFailure());
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        } on CacheException {
          return Left(CacheFailure());
        }
        } else {
          return Left(ServerFailure());
        }
      
      }else{
        return Left(UnAuthenticatedFailure());
      }
  }
  
    @override
    Future<Either<Failure, ApiSuccess>> deletePost(int postId) async{
     final accessToken = localDataSource.getAuthToken();
      if (accessToken != null) {
        if (await networkInfo.isConnected) {
          try{
            await remoteDataSource.deletePost(await accessToken, postId);
            ApiSuccessModel apiSuccessModel = new ApiSuccessModel(success: true, message: "Deleted");
            return Right(apiSuccessModel);
          }on ServerException {
          print("server exception");
          return Left(ServerFailure());
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        } on CacheException {
          return Left(CacheFailure());
        }
        } else {
          return Left(ServerFailure());
        }
      
      }else{
        return Left(UnAuthenticatedFailure());
      }
    }
  
    @override
    Future<Either<Failure, ApiSuccess>> editPost(int postId, String postDescription) async{
      final accessToken = localDataSource.getAuthToken();
      if (accessToken != null) {
        if (await networkInfo.isConnected) {
          try{
            await remoteDataSource.editPost(await accessToken,postId, postDescription,);
            ApiSuccessModel apiSuccessModel = new ApiSuccessModel(success: true, message: "Edited");
            return Right(apiSuccessModel);
          }on ServerException {
          print("server exception");
          return Left(ServerFailure());
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        } on CacheException {
          return Left(CacheFailure());
        }
        } else {
          return Left(ServerFailure());
        }
      
      }else{
        return Left(UnAuthenticatedFailure());
      }
    }
  
    @override
    Future<Either<Failure, GetMyPost>> getMyPost() async{
      final accessToken = localDataSource.getAuthToken();
      if (accessToken != null) {
        if (await networkInfo.isConnected) {
          try{
            final post = await remoteDataSource.getMyPost(await accessToken);
            return Right(post);
          } on ServerException {
            print("server exception");
            return Left(ServerFailure());
          } on UnAuthenticatedException {
            return Left(UnAuthenticatedFailure());
          } on CacheException {
            return Left(CacheFailure());
          }
        } else {
          return Left(ServerFailure());
        }
      
      }else{
        return Left(UnAuthenticatedFailure());
      }
    }
    
  
    @override
  Future<Either<Failure, ApiSuccess>> likePost(int postId) async{
    final accessToken = localDataSource.getAuthToken();
      if (accessToken != null) {
        if (await networkInfo.isConnected) {
          try{
            await remoteDataSource.likePost(await accessToken, postId);
            ApiSuccessModel apiSuccessModel = new ApiSuccessModel(success: true, message: "Liked");
            return Right(apiSuccessModel);
          }on ServerException {
          print("server exception");
          return Left(ServerFailure());
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        } on CacheException {
          return Left(CacheFailure());
        }
        } else {
          return Left(ServerFailure());
        }
      
      }else{
        return Left(UnAuthenticatedFailure());
      }
  }
  
}