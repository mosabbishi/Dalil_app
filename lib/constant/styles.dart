import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Styles {
  static final appBarStyle = const TextStyle(fontSize: 22, color: Colors.white);
  //
  static final categoriesDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(),
  );
  // box shadow
  static final boxShadows = const [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 1,
      color: Colors.grey,
    ),
  ];
  // colors
  static final red = HexColor('#b80f0a');
  //
  static final textThemes = TextTheme(
    bodyText2: TextStyle(fontFamily: 'Tajawal'),
    headline6: TextStyle(fontFamily: 'Tajawal'),
    headline5: TextStyle(fontFamily: 'Tajawal'),
  );
}
