import 'package:equatable/equatable.dart';

class PostsEntity extends Equatable {
  final int? id;
  final String? brand;
  final String? name;
  final String? price;
  final String? image_link;
  final String? product_link;
  final String? description;
  final double? rating;

  const PostsEntity({
    required this.brand,
    required this.price,
    required this.image_link,
    required this.product_link,
    required this.description,
    required this.rating,
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props =>
      [id, name, price, image_link, product_link, description, rating];
}
