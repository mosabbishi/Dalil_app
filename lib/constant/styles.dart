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
  static final black = HexColor('#151411');
  //
  static final textThemes = TextTheme(
    bodyText2: TextStyle(fontFamily: 'Tajawal'),
    headline6: TextStyle(fontFamily: 'Tajawal'),
    headline5: TextStyle(fontFamily: 'Tajawal'),
  );
  // input decoration
  static buildInputDecoration(String label, IconData suffix) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(suffix),
      focusColor: Styles.black,
      errorStyle: TextStyle(color: Styles.red),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Styles.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Styles.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Styles.black),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Styles.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Styles.red),
      ),
    );
  }
}
