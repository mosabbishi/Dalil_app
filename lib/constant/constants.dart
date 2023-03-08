import 'package:dalil_app/pages/inner_pages.dart/apliences.dart';
import 'package:dalil_app/pages/inner_pages.dart/buildings.dart';
import 'package:dalil_app/pages/inner_pages.dart/electronics.dart';
import 'package:dalil_app/pages/inner_pages.dart/vehicles.dart';
import 'package:dalil_app/pages/nav_pages/main_page.dart';
import 'package:dalil_app/pages/nav_pages/map_page.dart';
import 'package:dalil_app/pages/nav_pages/profile_page.dart';
import 'package:flutter/material.dart';

class Constants {
  // bottom navigation bar
  static List<BottomNavigationBarItem> navList = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'الرئيسية',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map_outlined),
      label: 'خريطة',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'حسابي',
    ),
  ];
  // navigation pages
  static List<Widget> navPages = const [
    MainPage(),
    MapPage(),
    ProfilePage(),
  ];
  // main categories content
  static List<Map<String, dynamic>> mainCategoriesMap = [
    {
      'title': 'خدمات المركبات',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/dalil-74c22.appspot.com/o/categories%2Fvs.jpg?alt=media&token=d5c34077-5c9a-422a-891b-8d4b4bd6b2cb',
      'route': Vehicles(
        subTitle: 'خدمات المركبات',
      ),
    },
    {
      'title': 'خدمات المنشآت',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/dalil-74c22.appspot.com/o/categories%2Fbs.jpg?alt=media&token=5e273a52-4c8e-4c28-9be6-89ef6ee8071b',
      'route': Buildings(subTitle: 'خدمات المنشآت'),
    },
    {
      'title': 'خدمات الأجهزة المنزلية',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/dalil-74c22.appspot.com/o/categories%2Fas.jpg?alt=media&token=051f16af-2036-47a6-9aa9-ed995baf828b',
      'route': Apliences(subTitle: 'خدمات الأجهزة المنزلية'),
    },
    {
      'title': 'خدمات الإلكترونيات',
      'image':
          'https://firebasestorage.googleapis.com/v0/b/dalil-74c22.appspot.com/o/categories%2Fes.jpg?alt=media&token=1b0695b8-caf9-49d6-8ff6-48c13576d5a4',
      'route': Electronics(subTitle: 'خدمات الإلكترونيات'),
    },
  ];
  //
  static final String img =
      'https://images.unsplash.com/photo-1677661248610-e3ba662fc4ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80';
}
