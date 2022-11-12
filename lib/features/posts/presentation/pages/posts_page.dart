import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/features/posts/presentation/blocs/posts_bloc.dart';
import 'package:e_commerce/features/posts/presentation/widgets/list_posts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('items'),
      ),
      body: Center(
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is LoadingPostsState) {
              return const LoadingWidget();
            } else if (state is LoadedPostsState) {
              return PostsList(posts: state.posts);
            } else if (state is ErrorPostsState) {
              return const Text('mss');
            }
            return const Text('Lodeing');
          },
        ),
      ),
    );
  }
}
