import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure,ApiSuccessModel>> loginUser(String email, String password);
  Future<Either<Failure,ApiSuccessModel>> registerUser(String email, String password,String passwordConfirmation);
  Future<Either<Failure,ApiSuccessModel>> logout();
  Future<Either<Failure,ApiSuccessModel>> refreshToken();
}