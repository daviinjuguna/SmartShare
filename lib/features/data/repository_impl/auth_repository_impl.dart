import 'package:SmartShare/core/errors/exceptions.dart';
import 'package:SmartShare/core/utils/network_info.dart';
import 'package:SmartShare/features/data/data_source/auth_api/auth_local_data.dart';
import 'package:SmartShare/features/data/data_source/auth_api/auth_remote_data.dart';
import 'package:SmartShare/features/data/data_source/image/image_data_source.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {@required this.localDataSource,
      @required this.remoteDataSource,
      @required this.networkInfo,
      });

  @override
  Future<Either<Failure, ApiSuccess>> logout() async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.logout(await accessToken);
          localDataSource.deleteCachedToken();
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "Logout success");
          return Right(apiSuccessModel);
        } on ServerException {
          return Left(ServerFailure());
        } on CacheException {
          return Left(CacheFailure());
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> refreshToken() async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          final response =
              await remoteDataSource.refreshToken(await accessToken);
          localDataSource.cacheAuthToken(response); //catchess the token again
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "Refresh success");
          return Right(apiSuccessModel);
        } on ServerException {
          return Left(ServerFailure());
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
  Future<Either<Failure, ApiSuccess>> registerUser(
      String email, String password, String passwordConfirmation) async {
    if (await networkInfo.isConnected) {
      try {
        final registerSuccessModel = await remoteDataSource.registerUser(
            email, password, passwordConfirmation);
        localDataSource.cacheAuthToken(registerSuccessModel);
        ApiSuccessModel apiSuccessModel =
            new ApiSuccessModel(success: true, message: "Register success");
        return Right(apiSuccessModel);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> loginUser(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final loginSuccessModel =
            await remoteDataSource.loginUser(email, password);
        localDataSource.cacheAuthToken(loginSuccessModel);
        ApiSuccessModel apiSuccessModel =
            new ApiSuccessModel(success: true, message: "Login success");
        return Right(apiSuccessModel);
      } on ServerException {
        return Left(ServerFailure());
      } on CacheException {
        return Left(CacheFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ApiSuccess>> saveUserInfo(
      String firstName, String lastName, String imageUrl) async {
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.saveUserInfo(await accessToken, firstName,
              lastName, imageUrl); //catchess the token again
          ApiSuccessModel apiSuccessModel =
              new ApiSuccessModel(success: true, message: "User Saved");
          return Right(apiSuccessModel);
        } on ServerException {
          return Left(ServerFailure());
        } on CacheException {
          return Left(CacheFailure());
        } on UnAuthenticatedException {
          return Left(UnAuthenticatedFailure());
        }
      } else {
        return Left(ServerFailure());
      }
    } else {
      return Left(UnAuthenticatedFailure());
    }
  }

}
