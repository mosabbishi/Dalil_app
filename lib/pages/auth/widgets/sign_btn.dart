import 'package:flutter/material.dart';

import '../../../constant/styles.dart';

class SignButton extends StatelessWidget {
  final String title;
  final Function() function;
  const SignButton({super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Styles.red,
          foregroundColor: Colors.white,
          elevation: 0.0,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
        ),
        onPressed: function,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
