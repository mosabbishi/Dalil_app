import 'package:dalil_app/constant/constants.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'دليل',
          style: Styles().appBarStyle,
        ),
        centerTitle: true,
        elevation: 0.0,
        // toolbarHeight: 80,
        backgroundColor: Colors.amberAccent,
      ),
      body: Constants().navPages[_currentIndex],
      // bottom nav bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: changePage,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.black38,
        items: Constants().navList,
      ),
    );
  }
}
