import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';
import 'package:e_commerce/features/posts/domain/usecases/fetch_posts_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final FetchPostsUseCase fetchPostsUseCase;

  PostsBloc({
    required FetchPostsUseCase fetchPostsUseCase
  })  : this.fetchPostsUseCase = fetchPostsUseCase,
        super(PostsState(status: PostsStateStatus.init));

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    if (event is EventFetchPosts) {
      yield* _handleFetchPD(event);
    }
  }

  Stream<PostsState> _handleFetchPD(EventFetchPosts event) async* {
    yield state.copyWith(status: PostsStateStatus.showLoading);
    final result = await fetchPostsUseCase(FetchPostsParam(id: event.id));
    yield state.copyWith(status: PostsStateStatus.hideLoading);
    yield result.fold(
      (failure) => state.copyWith(status: PostsStateStatus.loadedFailed, errorMessage: 'Có lỗi xảy ra. Vui lòng thử lại.'),
      (data) => state.copyWith(status: PostsStateStatus.loadedSuccess, detail: data)
    );
  }
}
