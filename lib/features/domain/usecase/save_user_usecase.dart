import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/core/utils/use_case.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:SmartShare/features/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveUserUseCase extends UseCase<ApiSuccess,SaveUserParams> {
  @override
  Future<Either<Failure, ApiSuccess>> call(SaveUserParams p) {
    return repository.saveUserInfo(p.firstName, p.lastName, p.imageUrl);
  }
  
  final AuthRepository repository;
  SaveUserUseCase({@required this.repository});

}

class SaveUserParams extends Equatable {
  SaveUserParams({
   @required this.firstName,@required this.lastName, this.imageUrl});

  @override
  List<Object> get props => [firstName,lastName,imageUrl];
  
  final String firstName;
  final String lastName;
  final String imageUrl;
}