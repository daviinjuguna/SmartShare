import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/features/data/model/auth/api_success_model.dart';
import 'package:SmartShare/features/domain/entities/auth/api_success.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, ApiSuccess>> loginUser(String email, String password);
  Future<Either<Failure, ApiSuccess>> registerUser(
      String email, String password, String passwordConfirmation);
  Future<Either<Failure, ApiSuccess>> logout();
  Future<Either<Failure, ApiSuccess>> refreshToken();
  Future<Either<Failure, ApiSuccess>> saveUserInfo(
      String firstName, String lastName, String imageUrl);
  Future<Either<Failure, String>> fetchImageUrl(String url);
}
