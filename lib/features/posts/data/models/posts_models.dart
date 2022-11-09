import '../../domain/entities/posts_entity.dart';

class PostsModel extends PostsEntity {
  const PostsModel({
    required super.brand,
    required super.price,
    required super.image_link,
    required super.product_link,
    required super.description,
    required super.rating,
    required super.name,
    required super.id,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json['id'],
      brand: json['brand'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      rating: json['rating'],
      image_link: json['image_link'],
      product_link: json['product_link'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': brand,
        'name': name,
        'price': price,
        'description': description,
        'rating': rating,
        'image_link': image_link,
        'product_link': product_link,
      };
}
