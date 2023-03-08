import 'package:flutter/material.dart';

import '../constant/styles.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 9.0,
      width: isActive ? 16.0 : 8.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: isActive ? Styles.red : Styles.black,
      ),
      duration: const Duration(milliseconds: 340),
    );
  }
}
