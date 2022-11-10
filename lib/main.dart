import 'package:e_commerce/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/posts/di/posts_injector.dart' as di;
import 'features/posts/presentation/blocs/posts_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Posts',
        home: FeedPage(),
      ),
    );
  }
}
