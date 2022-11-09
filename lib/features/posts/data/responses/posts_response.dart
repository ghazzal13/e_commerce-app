import 'package:flutter/foundation.dart';

class PostsResponse {
  final String id;
  final String name;
  PostsResponse({required this.id, required this.name});

  factory PostsResponse.fromJson(Map<String, dynamic> json) {
    return PostsResponse(name: json["name"], id: json["id"]);
  }
}
