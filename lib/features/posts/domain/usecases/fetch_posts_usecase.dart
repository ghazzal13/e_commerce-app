import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';
import 'package:e_commerce/features/posts/domain/repositories/posts_repository.dart';

class FetchPostsUseCase {
  final PostsRepository repository;

  FetchPostsUseCase(this.repository);

  Future<Either<Failure, List<PostsEntity>>> call() async {
    return await repository.getAllPosts();
  }
}
