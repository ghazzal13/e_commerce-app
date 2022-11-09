import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<PostsEntity>>> getAllPosts();
}
