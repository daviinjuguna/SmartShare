import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase extends UseCase<ApiSuccess,LoginParams> {
   final AuthRepository repository;

  LoginUseCase({@required this.repository});

  @override
  Future<Either<Failure, ApiSuccess>> call(LoginParams p) {
   return repository.loginUser(p.email,p.password);
  }
  
}

class LoginParams extends Equatable {
  final String email, password;

  LoginParams({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}