import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;

    return Container(
      height: size * 0.22,
      width: size * 0.45,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 57,
            child: Image.asset(
              'assets/pics/user2.png',
              fit: BoxFit.fill,
              height: 70,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('username'),
              Text('user email'),
              Text('edit button'),
            ],
          ),
        ],
      ),
    );
  }
}
