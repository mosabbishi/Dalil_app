import 'package:flutter/material.dart';

import '../../utilities/back_button.dart';

class Buildings extends StatelessWidget {
  final String subTitle;
  const Buildings({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subTitle),
        leading: const BackBtn(),
      ),
      body: Text('Buildings'),
    );
  }
}
