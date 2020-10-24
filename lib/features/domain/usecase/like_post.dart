import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LikePostUseCase extends UseCase<ApiSuccess,LikePostParams>{
  @override
  Future<Either<Failure, ApiSuccess>> call(LikePostParams p) {
    return repository.likePost(p.postId);
  }

  final PostRepository repository;
  LikePostUseCase({@required this.repository});
  
}

class LikePostParams extends Equatable {
  @override
  List<Object> get props => [postId];
  
  final int postId;

  LikePostParams({@required this.postId});
}