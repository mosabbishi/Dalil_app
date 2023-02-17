import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.amberAccent,
        toolbarHeight: 74,
        bottom: const PreferredSize(
          preferredSize: Size(2, 30),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: CupertinoSearchTextField(),
          ),
        ),
      ),
      body: ListView(),
    );
  }
}
