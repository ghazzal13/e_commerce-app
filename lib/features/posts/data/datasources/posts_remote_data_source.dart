import 'package:e_commerce/features/posts/data/responses/posts_response.dart';

abstract class PostsRemoteDataSource {
  Future<PostsResponse> fetchPosts({required String id});
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  @override
  Future<PostsResponse> fetchPosts({required String id}) async {
    return PostsResponse(id: "", name: "");
  }
}
