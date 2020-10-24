import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/home/get_post.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPostUseCase extends UseCase<List<GetPost>,NoParams> {
  final PostRepository repository;

  GetPostUseCase({@required this.repository});
  @override
  Future<Either<Failure, List<GetPost>>> call(NoParams params) {
    return repository.getPost();
  }
 
}