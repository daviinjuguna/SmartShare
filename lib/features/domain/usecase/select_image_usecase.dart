import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:SmartShare/features/domain/repository/image_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SelectImageUseCase extends UseCase<String, SelectImageParams> {
  final ImageRepository repository;

  SelectImageUseCase({@required this.repository});
  @override
  Future<Either<Failure, String>> call(SelectImageParams p) {
    return repository.fetchImageUrl(p.url);
  }
}

class SelectImageParams extends Equatable {
  final String url;

  SelectImageParams({@required this.url});

  @override
  List<Object> get props => [url];
}