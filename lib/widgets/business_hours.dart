import 'package:flutter/material.dart';

class BusinessHours extends StatelessWidget {
  final String day;
  final String opening;
  final String closing;
  const BusinessHours(
      {super.key,
      required this.day,
      required this.opening,
      required this.closing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${day} : '),
        Text('${opening} صباحا - '),
        Text('${closing} مساء'),
      ],
    );
  }
}
