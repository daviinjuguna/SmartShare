import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeletePostUseCase extends UseCase<ApiSuccess,DeletePostParams> {
  @override
  Future<Either<Failure, ApiSuccess>> call(DeletePostParams p) {
    return repository.deletePost(p.postId);
  }
  
  final PostRepository repository;
  DeletePostUseCase({@required this.repository});
}

class DeletePostParams extends Equatable{
  DeletePostParams({@required this.postId});

  @override
  List<Object> get props => [postId];
  
  final int postId;
}