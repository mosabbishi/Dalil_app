import 'package:dalil_app/constant/constants.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/auth/sign_in/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
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

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // drawer: Drawer(child: ListView(children: [UserAccountsDrawerHeader(accountName: accountName, accountEmail: accountEmail)],)),
        //
        body: SafeArea(
          child: Column(
            children: [
              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  height: size * 0.09,
                  width: double.infinity,
                  // color: Styles.black,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: FaIcon(
                          FontAwesomeIcons.user,
                          color: Colors.white,
                        ),
                        backgroundColor: Styles.red,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'أهلا, ',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () => _getCurrentLocation(),
                      //   child: _position != null
                      //       ? Column(
                      //           children: [
                      //             Text('location: $_position'),
                      //           ],
                      //         )
                      //       : const Text('get Location'),
                      // ),
                    ],
                  ),
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: size * 0.52,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemExtent: 90,
                    itemCount: Constants.mainCategoriesMap.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: InkWell(
                          onTap: () => Get.to(
                              Constants.mainCategoriesMap[index]['route']),
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
              ),
              //
              const Spacer(),
              ElevatedButton(
                onPressed: () => Get.to(() => SigninPage()),
                child: const Text('اقترح متجر'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
