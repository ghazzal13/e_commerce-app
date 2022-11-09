import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:e_commerce/features/posts/data/responses/posts_response.dart';
import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';
import 'package:e_commerce/features/posts/domain/repositories/posts_repository.dart';
import 'package:e_commerce/features/posts/domain/usecases/fetch_posts_usecase.dart';

class PostsRepositoryImpl implements PostsRepository {
  PostsRemoteDataSource postsRemoteDataSource;

  PostsRepositoryImpl({required this.postsRemoteDataSource});

  @override
  Future<Either<Failure, PostsEntity>> getAllPosts(
      {required FetchPostsParam params}) async {
    try {
      var response = await postsRemoteDataSource.fetchPosts(id: params.id);
      return Right(_mapPDResponseToEntity(response: response));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  PostsEntity _mapPDResponseToEntity({required PostsResponse response}) {
    return PostsEntity(
      id: response.id,
      name: response.name,
    );
  }
}
