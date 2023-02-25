import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {},
        child: const Text('نسيت كلمة المرور'),
      ),
    );
  }
}
