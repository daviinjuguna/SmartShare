import 'package:SmartShare/core/errors/failures.dart';
import 'package:SmartShare/features/data/model/post/get_post_model.dart';
import 'package:SmartShare/features/data/model/post/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<GetPostModel>>> getPost();
}