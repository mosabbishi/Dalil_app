import 'package:dalil_app/constant/constants.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final style = const TextStyle(fontSize: 18, color: Colors.white);
  final String username;
  final String? email;
  final String? password;
  const UserData(
      {super.key, required this.username, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              Constants.img,
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
          Text(
            username,
            style: style,
          ),
          Text(
            email!,
            style: style,
          ),
        ],
      ),
    );
  }
}
