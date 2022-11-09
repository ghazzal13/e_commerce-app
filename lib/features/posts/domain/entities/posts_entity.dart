import 'package:equatable/equatable.dart';

class PostsEntity extends Equatable {
  final String? id;
  final String? name;

  PostsEntity({this.id, this.name});

  @override
  List<Object> get props => [id ?? '', name ?? ''];
}
