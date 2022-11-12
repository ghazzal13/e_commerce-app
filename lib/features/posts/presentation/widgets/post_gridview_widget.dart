import 'package:e_commerce/features/posts/presentation/pages/post_deatils_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget postGridView(context, post, size) => InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostDetalisPage(
              post: post,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: BorderRadius.circular(15),
        ),
        width: size.width * .4,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      post.image_link.toString(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                post.name.toString(),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Price : ',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${post.price.toString()} \$",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  post.rating != null
                      ? RatingBar.builder(
                          initialRating: post.rating!.floorToDouble(),
                          minRating: 1,
                          itemSize: 12,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (_) {},
                        )
                      : RatingBarIndicator(
                          rating: 0,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 12.0,
                          direction: Axis.horizontal,
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
