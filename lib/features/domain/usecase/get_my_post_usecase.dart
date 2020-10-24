import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/home/get_my_post.dart';
import 'package:SmartShare/features/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMyPostUseCase extends UseCase<GetMyPost,NoParams> {
  @override
  Future<Either<Failure, GetMyPost>> call(NoParams params) {
    return repository.getMyPost();
  }
  
  final PostRepository repository;
  GetMyPostUseCase({@required this.repository});
}