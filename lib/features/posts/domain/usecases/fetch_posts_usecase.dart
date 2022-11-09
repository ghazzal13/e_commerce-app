import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/usecases/usecase.dart';
import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';
import 'package:e_commerce/features/posts/domain/repositories/posts_repository.dart';

class FetchPostsUseCase extends UseCase<PostsEntity, FetchPostsParam> {
  final PostsRepository repository;

  FetchPostsUseCase(this.repository);

  @override
  Future<Either<Failure, PostsEntity>> call(FetchPostsParam params) async {
    return await repository.getAllPosts(params: params);
  }
}

class FetchPostsParam {
  String id;
  FetchPostsParam({required this.id});
}
