import 'package:flutter/material.dart';

class NoReviews extends StatelessWidget {
  const NoReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/pics/rev2.png',
          fit: BoxFit.cover,
          height: 300,
          width: 300,
        ),
        const Text('no reviews yet'),
      ],
    );
  }
}
