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
  List<BottomNavigationBarItem> navList = const [
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
  List<Widget> navPages = const [
    MainPage(),
    SearchPage(),
    MapPage(),
    ProfilePage(),
  ];
  // main categories content
  List<Map<String, dynamic>> mainCategoriesMap = [
    {
      'title': 'خدمات المركبات',
      'icon': const Icon(Icons.settings),
      'route': const Vehicles(subTitle: 'خدمات المركبات',),
    },
    {
      'title': 'خدمات المنشآت',
      'icon': const Icon(Icons.dangerous),
      'route': const Buildings(subTitle: 'خدمات المنشآت'),
    },
    {
      'title': 'خدمات الأجهزة المنزلية',
      'icon': const Icon(Icons.hail),
      'route': const Apliences(subTitle: 'خدمات الأجهزة المنزلية'),
    },
    {
      'title': 'خدمات الإلكترونيات',
      'icon': const Icon(Icons.safety_check),
      'route': const Electronics(subTitle: 'خدمات الإلكترونيات'),
    },
  ];
}
