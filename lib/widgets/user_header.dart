import 'package:flutter/material.dart';

class HeaderAvatar extends StatelessWidget {
  const HeaderAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        border: Border.all(color: Colors.redAccent),
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Image.asset(
        'assets/pics/man.png',
        height: 55,
      ),
    );
  }
}
