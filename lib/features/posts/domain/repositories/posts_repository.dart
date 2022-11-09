import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';
import 'package:e_commerce/features/posts/domain/usecases/fetch_posts_usecase.dart';

abstract class PostsRepository {
  Future<Either<Failure, PostsEntity>> getAllPosts(
      {required FetchPostsParam params});
}
