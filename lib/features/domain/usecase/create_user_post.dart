import 'dart:io';

import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreatePostUseCase extends UseCase<ApiSuccess,CreatePostParams>{
  final PostRepository repository;
  
  CreatePostUseCase({@required this.repository});

  @override
  Future<Either<Failure, ApiSuccess>> call(CreatePostParams p) {
    return repository.createUserPost(p.postDescription, p.imageUrl);
  }
}

class CreatePostParams extends Equatable {
  CreatePostParams({@required this.postDescription,this.imageUrl});

  @override
  List<Object> get props => [postDescription,imageUrl];
  
  final String postDescription;
  final String imageUrl;
}