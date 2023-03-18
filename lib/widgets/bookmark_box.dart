import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class BookmarksBox extends StatelessWidget {
  final String image;
  final String title;
  final String address;
  final Function() function;

  const BookmarksBox({
    super.key,
    required this.image,
    required this.title,
    required this.address,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 1,
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: FancyShimmerImage(
                imageUrl: image,
                boxFit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Text(
                address,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'view on map',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
