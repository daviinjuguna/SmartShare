import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RefreshTokenUseCase extends UseCase<ApiSuccess,NoParams> {
  @override
  Future<Either<Failure, ApiSuccess>> call(NoParams params) {
    return repository.refreshToken();
  }
  
  final AuthRepository repository;
  RefreshTokenUseCase({@required this.repository});
}