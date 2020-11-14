import 'package:SmartShare/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ImageRepository  {
  Future<Either<Failure, String>> fetchImageUrl(String url);
}