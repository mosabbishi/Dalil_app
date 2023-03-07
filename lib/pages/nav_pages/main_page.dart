import 'package:dalil_app/constant/constants.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/auth/sign_in/signin_page.dart';
import 'package:dalil_app/pages/inner_details/suggeestion_page.dart';
import 'package:dalil_app/pages/nav_pages/search_page.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/utilities/search_bar.dart';
import 'package:dalil_app/widgets/header_welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String address1 = '';
  String address2 = '';
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  Position? _position;
  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _position = position;
    });
  }

  User? user;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
     
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Styles.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      //
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWelcome(),
          //
          const SearchBar(),
          //
          buildCategory(height: size * 0.52),
          //
          Center(
            child: ElevatedButton(
              onPressed: () => Get.to(() => const SuggestionPage()),
              child: const Text('اقترح متجر'),
            ),
          ),
        ],
      )),
    );
  }
}

//

//
buildCategory({required double height}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SizedBox(
      height: height,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemExtent: 90,
        itemCount: Constants.mainCategoriesMap.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () => Get.to(Constants.mainCategoriesMap[index]['route']),
              child: Container(
                decoration: Styles.categoriesDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Constants.mainCategoriesMap[index]['icon'],
                    Text(
                      Constants.mainCategoriesMap[index]['title'],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
