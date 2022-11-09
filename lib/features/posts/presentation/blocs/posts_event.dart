part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EventFetchPosts extends PostsEvent {
  final String id;

  EventFetchPosts({required this.id});

  @override
  List<Object> get props => [id];
}