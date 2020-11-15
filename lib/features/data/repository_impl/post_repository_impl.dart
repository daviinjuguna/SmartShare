import 'dart:io';

import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/network_info.dart';
import 'package:SmartShare/features/data/data_source/auth_api/auth_local_data.dart';
import 'package:SmartShare/features/data/data_source/comments_api/comments_local_data_source.dart';
import 'package:SmartShare/features/data/data_source/comments_api/comments_remote.dart';
import 'package:SmartShare/features/data/data_source/post_api/post_local_data.dart';
import 'package:SmartShare/features/data/data_source/post_api/post_remote_data.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:SmartShare/features/domain/entities/home/get_comment.dart';
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
  final CommentsRemoteDataSource commentsRemoteDataSource;
  final NetworkInfo networkInfo;
  final PostLocalDataSource postLocalDataSource;
  final CommentLocalDataSource commentLocalDataSource;

  PostRepositoryImpl(
      {@required this.localDataSource,
      @required this.remoteDataSource,
      @required this.networkInfo,
      @required this.commentsRemoteDataSource,
      @required this.postLocalDataSource,
      @required this.commentLocalDataSource});

  @override
  Future<Either<Failure, List<GetPost>>> getPost() async {
    final accessToken = localDataSource.getAuthToken();
    final cachedPost = await postLocalDataSource.getCachedPost();
    if (cachedPost.isEmpty) {
      if (accessToken != null) {
        if (await networkInfo.isConnected) {
          try {
            final post = await remoteDataSource.getPost(await accessToken);
            if (post.isNotEmpty) {
              await postLocalDataSource.cachePost(post);
            }

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
      } else {
        return Left(UnAuthenticatedFailure());
      }
    } else {
      return Right(cachedPost);
    }
  }

  @override
  Future<Either<Failure, GetPost>> createUserPost(
      String postDescription, String imageUrl) async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          final post = await remoteDataSource.createUserPost(
              await accessToken, postDescription, imageUrl);
          // ApiSuccessModel apiSuccessModel =
          //     new ApiSuccessModel(success: true, message: "Created");
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
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> deletePost(int postId) async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.deletePost(await accessToken, postId);
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "Deleted");
          return Right(apiSuccessModel);
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
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> editPost(
      int postId, String postDescription) async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.editPost(
            await accessToken,
            postId,
            postDescription,
          );
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "Edited");
          return Right(apiSuccessModel);
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
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, GetMyPost>> getMyPost() async {
    final accessToken = localDataSource.getAuthToken();
    final cachedMyPost = await postLocalDataSource.getCachedMyPost();
    if (cachedMyPost.isEmpty) {
      if (accessToken != null) {
        if (await networkInfo.isConnected) {
          try {
            final post = await remoteDataSource.getMyPost(await accessToken);
            if (post.post.isNotEmpty) {
              await postLocalDataSource.cacheMyPost(post);
            }
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
      } else {
        return Left(UnAuthenticatedFailure());
      }
    } else {
      return Right(cachedMyPost.single);
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> likePost(int postId) async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.likePost(await accessToken, postId);
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "Liked");
          return Right(apiSuccessModel);
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
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

  //!comments section

  @override
  Future<Either<Failure, GetComments>> createComments(
      int postId, String comments) async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          final getComments = await commentsRemoteDataSource.createComments(
              await accessToken, postId, comments);
          // ApiSuccessModel apiSuccessModel = new ApiSuccessModel(success: true, message: "comments created");
          return Right(getComments);
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
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, List<GetComments>>> getComments(int postId) async {
    final accessToken = localDataSource.getAuthToken();
    final cachedComments = await commentLocalDataSource.getCachedComments();
    if (cachedComments.isEmpty) {
      if (accessToken != null) {
        if (await networkInfo.isConnected) {
          try {
            final comments = await commentsRemoteDataSource.getComments(
                await accessToken, postId);
            if (comments.isNotEmpty) {
              await commentLocalDataSource.cacheComments(comments);
            }

            return Right(comments);
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
      } else {
        return Left(UnAuthenticatedFailure());
      }
    } else {
      return Right(cachedComments);
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> editComments(
      int commentId, String comments) async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          await commentsRemoteDataSource.editComments(
              await accessToken, commentId, comments);
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "Comments Edited");
          return Right(apiSuccessModel);
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
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> deleteComments(int commentId) async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          await commentsRemoteDataSource.deleteComments(
              await accessToken, commentId);
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "Comments Deleted");
          return Right(apiSuccessModel);
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
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }
}
