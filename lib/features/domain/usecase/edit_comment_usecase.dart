import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class EditCommentUseCase extends UseCase<ApiSuccess,EditCommentParams>{
  EditCommentUseCase({@required this.repository});

  @override
  Future<Either<Failure, ApiSuccess>> call(EditCommentParams p) {
    return repository.editComments(p.commentId, p.comments);
  }

  final PostRepository repository;

}

class EditCommentParams extends Equatable{
  EditCommentParams({
    @required this.commentId,
    @required this.comments});

  @override
  List<Object> get props => [commentId,comments];
  
  final int commentId;
  final String comments;
}