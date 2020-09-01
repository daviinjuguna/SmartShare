import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUseCase extends UseCase<ApiSuccessModel,RegisterParams>{
  final AuthRepository repository;

  RegisterUseCase({@required this.repository});

  @override
  Future<Either<Failure, ApiSuccessModel>> call(RegisterParams p) {
    return repository.registerUser(p.email, p.password, p.passwordConfirmation);
  }
  
}

class RegisterParams extends Equatable{
  final String email;
  final String password;
  final String passwordConfirmation;

  RegisterParams({
  @required this.email, 
  @required this.password,
  @required  this.passwordConfirmation});

  @override
  List<Object> get props => [email, password,passwordConfirmation];
}