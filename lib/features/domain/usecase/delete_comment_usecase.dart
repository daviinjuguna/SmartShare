import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCommentUseCase extends UseCase<ApiSuccess,ParamsId>{
  DeleteCommentUseCase({@required this.repository});

  @override
  Future<Either<Failure, ApiSuccess>> call(ParamsId p) {
   return repository.deleteComments(p.id);
  }
  
  final PostRepository repository;
}