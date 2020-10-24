import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditPostUseCase extends UseCase<ApiSuccess,EditPostParams> {
  @override
  Future<Either<Failure, ApiSuccess>> call(EditPostParams p) {
    return repository.editPost(p.postId, p.postDescription);
  }
  
  final PostRepository repository;
  EditPostUseCase({@required this.repository});
}

class EditPostParams extends Equatable{
  EditPostParams({@required this.postId,@required this.postDescription});

  @override
  List<Object> get props => [postId,postDescription];
  
  final int postId;
  final String postDescription;
}