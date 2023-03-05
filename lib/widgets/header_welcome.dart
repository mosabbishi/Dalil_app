import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';

class HeaderWelcome extends StatelessWidget {
  final String username;
  // final Function() function;
  const HeaderWelcome({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Styles.black),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Image.asset('assets/pics/icons8-account-40.png')),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 12.0),
          child: Row(
            children: [
              const Text(
                'Hello,',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                username,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
