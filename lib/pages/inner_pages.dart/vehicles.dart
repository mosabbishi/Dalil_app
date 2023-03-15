import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/utilities/back_button.dart';
import 'package:dalil_app/utilities/search_bar.dart';
import 'package:flutter/material.dart';

class Vehicles extends StatelessWidget {
  final String subTitle;
  Vehicles({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 7,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Styles.red,
                elevation: 0.0,
                title: Text(subTitle),
                leading: const BackBtn(),
                bottom: PreferredSize(
                  preferredSize: const Size(1, 110),
                  child: Column(children: [
                    const SearchBar(),
                    ButtonsTabBar(
                      backgroundColor: Colors.red,
                      unselectedBackgroundColor: Colors.grey[300],
                      unselectedLabelStyle:
                          const TextStyle(color: Colors.black),
                      labelStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.circle),
                          text: "الكل",
                        ),
                        Tab(
                          icon: Icon(Icons.local_gas_station),
                          text: "بنزين",
                        ),
                        Tab(
                          icon: Icon(Icons.shield_outlined),
                          text: "حماية",
                        ),
                        Tab(
                          icon: Icon(Icons.local_car_wash_outlined),
                          text: "نظافة",
                        ),
                        Tab(
                          icon: Icon(Icons.carpenter_outlined),
                          text: "تشليح",
                        ),
                        Tab(
                          icon: Icon(Icons.car_repair_outlined),
                          text: "خدمة سريعة",
                        ),
                        Tab(
                          icon: Icon(Icons.tire_repair_sharp),
                          text: "إطارات",
                        ),
                      ],
                    ),
                  ]),
                )),
            body: TabBarView(children: [
              Tab(
                child: FireStoreServices.all(),
              ),
              Tab(
                child: FireStoreServices.type(type: 'بنزين'),
              ),
              Tab(
                child: FireStoreServices.type(type: 'حماية'),
              ),
              Tab(
                child: FireStoreServices.type(type: 'نظافة'),
              ),
              Tab(
                child: FireStoreServices.type(type: 'تشليح'),
              ),
              Tab(
                child: FireStoreServices.type(type: 'خدمة سريعة'),
              ),
              Tab(
                child: FireStoreServices.type(type: 'إطارات'),
              ),
            ]),
          ),
        ));
  }

}
