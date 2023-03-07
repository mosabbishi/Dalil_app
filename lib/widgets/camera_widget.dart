import 'package:flutter/material.dart';

class CameraWidget extends StatelessWidget {
  final Function() function;
  const CameraWidget({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
    );
  }
}
