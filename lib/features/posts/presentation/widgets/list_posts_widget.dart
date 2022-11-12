import 'package:e_commerce/features/posts/domain/entities/posts_entity.dart';
import 'package:e_commerce/features/posts/presentation/widgets/post_gridview_widget.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  final List<PostsEntity> posts;
  const PostsList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        shrinkWrap: true,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 1.2,
        children: List.generate(
            posts.length, (index) => postGridView(context, posts[index], size)),
      ),
    );
  }
}
