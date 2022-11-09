import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/features/posts/di/posts_injector.dart';
import 'package:e_commerce/features/posts/presentation/blocs/posts_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key, this.arguments}) : super(key: key);
  final Map<String, dynamic>? arguments;

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  bool _isLoading = false;
  PostsBloc? _bloc;

  @override
  void initState() {
    _bloc = PostsBloc(fetchPostsUseCase: fetchPostsUseCase);
    _fetchPostsData();
    super.initState();
  }

  @override
  void dispose() {
    _bloc = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc ?? PostsBloc(fetchPostsUseCase: fetchPostsUseCase),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('App bar')),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        BlocBuilder<PostsBloc, PostsState>(
          buildWhen: (previous, current) {
            return current.status == PostsStateStatus.loadedSuccess ||
                current.status == PostsStateStatus.loadedFailed;
          },
          builder: (_, state) {
            if (state.status == PostsStateStatus.loadedSuccess) {
              return SafeArea(
                child: Stack(
                  children: [Positioned(top: 0, left: 0, right: 0, bottom: 0, child: Center(child: Text('Welcome!')))
                  ]
                ),
              );
            } else if (state.status == PostsStateStatus.loadedFailed) {
              return Container(color: Colors.red);
            } else {
              return const SizedBox();
            }
          },
        ),
        BlocListener<PostsBloc, PostsState>(
          listenWhen: (previous, current) {
            return current.status == PostsStateStatus.showLoading || current.status == PostsStateStatus.hideLoading;
          },
          listener: (_, state) {
            switch (state.status) {
              case PostsStateStatus.showLoading:
                _handleLoadingData(true);
                break;
              case PostsStateStatus.hideLoading:
                _handleLoadingData(false);
                break;
              default:
            }
          },
          child: _widgetLoading(_isLoading),
        ),
      ],
    );
  }

  Widget _widgetLoading(bool isLoading) {
    if (isLoading) {
      return Positioned.fill(
        child: Container(
          color: Colors.transparent,
          child: Center(child: Text('Loading...')),
        ),
      );
    }
    return const SizedBox();
  }

  void _handleLoadingData(bool loading) {
      setState(() {
        _isLoading = loading;
      });
  }

  void _fetchPostsData() {
    _bloc?.add(EventFetchPosts(id: 'xxx'));
  }
}
