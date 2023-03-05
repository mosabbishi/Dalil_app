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
      'icon': const Icon(Icons.settings),
      'route': Vehicles(
        subTitle: 'خدمات المركبات',
      ),
    },
    {
      'title': 'خدمات المنشآت',
      'icon': const Icon(Icons.dangerous),
      'route': Buildings(subTitle: 'خدمات المنشآت'),
    },
    {
      'title': 'خدمات الأجهزة المنزلية',
      'icon': const Icon(Icons.hail),
      'route': Apliences(subTitle: 'خدمات الأجهزة المنزلية'),
    },
    {
      'title': 'خدمات الإلكترونيات',
      'icon': const Icon(Icons.safety_check),
      'route': Electronics(subTitle: 'خدمات الإلكترونيات'),
    },
  ];
  //
  static final String img =
      'https://images.unsplash.com/photo-1677661248610-e3ba662fc4ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80';
}
