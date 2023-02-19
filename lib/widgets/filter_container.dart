import 'package:flutter/material.dart';

class FilterContainer extends StatelessWidget {
  final String type;
  const FilterContainer({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100)),
        child: Text(
          type,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
