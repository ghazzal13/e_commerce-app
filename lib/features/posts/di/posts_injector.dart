import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/posts/data/datasources/posts_local_data_source.dart';
import 'package:e_commerce/features/posts/data/datasources/posts_remote_data_source.dart';
import 'package:e_commerce/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:e_commerce/features/posts/domain/repositories/posts_repository.dart';
import 'package:e_commerce/features/posts/domain/usecases/fetch_posts_usecase.dart';
import 'package:e_commerce/features/posts/presentation/blocs/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  //useCase
  sl.registerLazySingleton(() => FetchPostsUseCase(sl()));
  //repository
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()));

  //data
  sl.registerLazySingleton<PostsRemoteDataSource>(
      () => PostsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));
  //

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
