import 'dart:convert';

import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/features/posts/data/models/posts_models.dart';

import 'package:http/http.dart' as http;

abstract class PostsRemoteDataSource {
  Future<List<PostsModel>> getAllPosts();
}

const BASE_URL =
    "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  late final http.Client client;

  PostsRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostsModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/posts/"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostsModel> postsModels = decodedJson
          .map<PostsModel>(
              (jsonPostModel) => PostsModel.fromJson(jsonPostModel))
          .toList();

      return postsModels;
    } else {
      throw ServerException();
    }
  }
}
