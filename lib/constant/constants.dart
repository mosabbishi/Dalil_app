import 'package:dalil_app/pages/inner_nav_pages.dart/apliences.dart';
import 'package:dalil_app/pages/inner_nav_pages.dart/buildings.dart';
import 'package:dalil_app/pages/inner_nav_pages.dart/electronics.dart';
import 'package:dalil_app/pages/inner_nav_pages.dart/vehicles.dart';
import 'package:dalil_app/pages/nav_pages/main_page.dart';
import 'package:dalil_app/pages/nav_pages/map_page.dart';
import 'package:dalil_app/pages/nav_pages/profile_page.dart';
import 'package:dalil_app/pages/nav_pages/search_page.dart';
import 'package:flutter/material.dart';

class Constants {
  // bottom navigation bar
  static List<BottomNavigationBarItem> navList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'الرئيسية',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'بحث',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.map_outlined),
      label: 'خريطة',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined),
      label: 'حسابي',
    ),
  ];
  // navigation pages
  static List<Widget> navPages = const [
    MainPage(),
    SearchPage(),
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

}
