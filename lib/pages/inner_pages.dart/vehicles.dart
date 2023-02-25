import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/inner_details/stores_tile.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/utilities/back_button.dart';
import 'package:dalil_app/utilities/search_bar.dart';
import 'package:flutter/material.dart';

class Vehicles extends StatelessWidget {
  final String subTitle;
  Vehicles({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
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
                child: FireStoreServices().all(),
              ),
              Tab(
                child: Text('fff'),
              ),
              Tab(
                child: Text('fff'),
              ),
              Tab(
                child: Text('xx'),
              ),
              Tab(
                child: Text('ssf'),
              ),
              Tab(
                child: Text('ssf'),
              ),
              Tab(
                child: Text('ssf'),
              ),
            ]),
          ),
        ));
  }

  // Widget all() {
  //   return StreamBuilder(
  //       stream: ref.snapshots(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return ListView.builder(
  //             physics: const NeverScrollableScrollPhysics(),
  //             shrinkWrap: true,
  //             itemCount: snapshot.data!.docs.length,
  //             itemBuilder: (context, i) {
  //               return StoreTile(
  //                 title: snapshot.data!.docs[i]['name'],
  //                 subtitle: snapshot.data!.docs[i]['name'],
  //                 onTap: () {},
  //               );
  //             },
  //           );
  //         }
  //         if (snapshot.hasError) {
  //           return const Center(
  //             child: Text('error'),
  //           );
  //         }
  //         if (!snapshot.hasData) {
  //           return const Text('no data yet');
  //         }
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //         return const Center(child: Text('Loading...'));
  //       });
  // }
}
