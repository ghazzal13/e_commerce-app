import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';
import 'package:e_commerce/features/posts/presentation/widgets/post_body_widget.dart';
import 'package:flutter/material.dart';

class PostDetalisPage extends StatelessWidget {
  final PostsEntity post;
  const PostDetalisPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.name.toString()),
        ),
        body: postBody(post, context));
  }
}
