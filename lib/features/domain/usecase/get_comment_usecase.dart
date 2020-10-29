import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/home/get_comment.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCommentUseCase extends UseCase<List<GetComments>,ParamsId>{
  GetCommentUseCase({@required this.repository});
  final PostRepository repository;
  @override
  Future<Either<Failure, List<GetComments>>> call(ParamsId p) {
    return repository.getComments(p.id);
  }
  
}