import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  const PageViewItem({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 140,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Styles.white),
                ),
                Text(
                  content,
                  style: TextStyle(color: Styles.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
