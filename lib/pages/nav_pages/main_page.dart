import 'package:dalil_app/constant/constants.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../widgets/drop_down_btn.dart';
import '../../widgets/header.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        //
        body: SafeArea(
          child: Column(
            children: [
              //
              Container(
                height: size * 0.12,
                width: double.infinity,
                color: Colors.amberAccent,
                child: Center(
                  child: TextButton(
                    onPressed: () => _getCurrentLocation(),
                    child: _position != null
                        ? Column(
                            children: [
                              Text('location: $_position'),
                            ],
                          )
                        : Text('get Location'),
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
                onPressed: () {},
                child: const Text('اقترح متجر'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
