import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BackBtn extends StatelessWidget {
  final Color? color;
  const BackBtn({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.chevronRight,
        color: color,
      ),
      onPressed: () => Get.back(),
    );
  }
}
