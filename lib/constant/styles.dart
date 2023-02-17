import 'package:flutter/material.dart';

class Styles {
  final appBarStyle = const TextStyle(fontSize: 22, color: Colors.white);
  //
  final categoriesDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(),
  );
  // box shadow
  final boxShadows = const [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 1,
      color: Colors.grey,
    ),
  ];
}
