import 'dart:io';

import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<GetPost>>> getPost();
  Future<Either<Failure,GetMyPost>>getMyPost();
  Future<Either<Failure, ApiSuccess>>createUserPost(String postDescription,String imageUrl);
  Future<Either<Failure,ApiSuccess>>editPost(int postId,String postDescription);
  Future<Either<Failure,ApiSuccess>>deletePost(int postId,);
  Future<Either<Failure,ApiSuccess>>likePost(int postId,);
}