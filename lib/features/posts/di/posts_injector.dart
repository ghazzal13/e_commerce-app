import 'package:e_commerce/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:e_commerce/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:e_commerce/features/posts/domain/usecases/fetch_posts_usecase.dart';

final _injector = _Injector();
final fetchPostsUseCase = _injector.fetchPostsUseCase;

class _Injector {
  _Injector._internal();
  static final _singleton = _Injector._internal();
  factory _Injector() => _singleton;

  PostsRemoteDataSourceImpl get postsRemoteDataSourceImpl => PostsRemoteDataSourceImpl();
  PostsRepositoryImpl get postsRepositoryImpl => PostsRepositoryImpl(postsRemoteDataSource: postsRemoteDataSourceImpl);
  FetchPostsUseCase get fetchPostsUseCase => FetchPostsUseCase(postsRepositoryImpl);
}
