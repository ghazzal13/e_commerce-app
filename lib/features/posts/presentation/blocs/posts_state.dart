part of 'posts_bloc.dart';

enum PostsStateStatus {
  init,
  showLoading,
  hideLoading,
  loadedSuccess,
  loadedFailed,
}

class PostsState extends Equatable {
  final PostsStateStatus? status;
  final PostsEntity? detail;
  final String? errorMessage;

  PostsState({this.status, this.detail, this.errorMessage});

  PostsState copyWith({PostsStateStatus? status, PostsEntity? detail, String? errorMessage}) =>
      PostsState(
       status: status ?? this.status,
       detail: detail ?? this.detail,
       errorMessage: errorMessage ?? this.errorMessage);

  @override
  List<Object> get props => [status ?? '', detail ?? '', errorMessage ?? ''];
}
