import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/network_info.dart';
import 'package:SmartShare/features/data/data_source/auth_api/auth_local_data.dart';
import 'package:SmartShare/features/data/data_source/post_api/post_remote_data.dart';
import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:SmartShare/features/data/model/post/post_model.dart';
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
  Future<Either<Failure, List<GetPostModel>>> getPost() async{
    final accessToken = localDataSource.getAuthToken();
    if (accessToken != null) {
      if (await networkInfo.isConnected) {
        final post = await remoteDataSource.getPost(await accessToken);
        
        return Right(post);
      } else {
        return Left(ServerFailure());
      }
      
    }else{
      return Left(UnAuthenticatedFailure());
    }
  }
  
}