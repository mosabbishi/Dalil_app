import 'package:dalil_app/utilities/back_button.dart';
import 'package:flutter/material.dart';

class Vehicles extends StatelessWidget {
  final String subTitle;
  const Vehicles({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subTitle),
        leading: const BackBtn(),
      ),
      body: const Text('vehicles'),
    );
  }
}
