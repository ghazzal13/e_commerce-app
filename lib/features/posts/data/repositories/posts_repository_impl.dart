import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failures.dart';
import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';
import 'package:e_commerce/features/posts/domain/repositories/posts_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../datasources/posts_local_data_source.dart';

class PostsRepositoryImpl implements PostsRepository {
  PostsRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImpl(
      {required this.localDataSource,
      required this.networkInfo,
      required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PostsEntity>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
