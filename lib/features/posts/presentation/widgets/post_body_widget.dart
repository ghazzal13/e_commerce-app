import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget postBody(post, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              post.name.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    post.image_link.toString(),
                  ),
                ),
              ),
            ),
            const Divider(color: Colors.black),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Price : ',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: post.price.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    post.rating != null
                        ? RatingBar.builder(
                            initialRating: post.rating!.floorToDouble(),
                            minRating: 1,
                            itemSize: 15,
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
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          ),
                    const SizedBox(
                      width: 3,
                    ),
                    post.rating != null
                        ? Text(
                            post.rating.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        : const Text(
                            "   0.0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                text: 'Description : ',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: post.description.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            AnimatedButton(
              height: 70,
              width: 200,
              text: 'Add to Card ',
              isReverse: false,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              selectedTextColor: Colors.black,
              selectedBackgroundColor: Colors.green,
              backgroundColor: Colors.yellowAccent,
              borderColor: Colors.grey,
              borderRadius: 50,
              borderWidth: .5,
              onPress: () {},
            ),
          ],
        ),
      ),
    );
