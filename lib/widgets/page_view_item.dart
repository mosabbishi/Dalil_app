import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/models/pageView_model.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  // final String title;
  // final String content;
  // final String image;
  final PageViewModel pageViewModel;

  const PageViewItem({
    required this.pageViewModel,
    Key? key,
    // required this.title,
    // required this.content,
    // required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(pageViewModel.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 150,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    pageViewModel.title,
                    style: TextStyle(
                      color: Styles.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                Text(
                  pageViewModel.content,
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
