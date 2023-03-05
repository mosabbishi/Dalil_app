import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserHeader extends StatelessWidget {
  final Function() function;
  const UserHeader({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        onPressed: function,
        icon: FaIcon(FontAwesomeIcons.clipboardUser, color: Styles.red),
      ),
    );
  }
}
