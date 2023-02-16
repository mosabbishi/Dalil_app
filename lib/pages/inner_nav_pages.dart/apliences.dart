import 'package:flutter/material.dart';

import '../../utilities/back_button.dart';

class Apliences extends StatelessWidget {
  final String subTitle;
  const Apliences({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subTitle),
        leading: const BackBtn(),
      ),
      body: Text('Apliences'),
    );
  }
}
