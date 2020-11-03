import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/entities/home/get_comment.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateCommentUseCase extends UseCase<GetComments, CreateCommentParams> {
  CreateCommentUseCase({@required this.repository});

  @override
  Future<Either<Failure, GetComments>> call(CreateCommentParams p) {
    return repository.createComments(p.postId, p.comments);
  }

  final PostRepository repository;
}

class CreateCommentParams extends Equatable {
  CreateCommentParams({@required this.postId, @required this.comments});

  @override
  List<Object> get props => [];

  final int postId;
  final String comments;
}
