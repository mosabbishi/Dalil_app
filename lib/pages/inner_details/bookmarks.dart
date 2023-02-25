import 'package:dalil_app/utilities/back_button.dart';
import 'package:flutter/material.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackBtn(),
          title: const Text('العلامات المرجعية'),
        ),
      ),
    );
  }
}
