import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/utilities/search_bar.dart';
import 'package:flutter/material.dart';

import '../../utilities/back_button.dart';

class Electronics extends StatelessWidget {
  final String subTitle;
  const Electronics({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text(subTitle),
            leading: const BackBtn(),
            bottom: PreferredSize(
              preferredSize: const Size(1, 110),
              child: Column(
                children: [
                  const SearchBar(),
                  ButtonsTabBar(
                    backgroundColor: Colors.red,
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: const TextStyle(color: Colors.black),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: FireStoreServices.all(),
              ),
              Tab(
                child: FireStoreServices.type(type: 'بنزين'),
              ),
              Tab(
                child: FireStoreServices.type(type: 'protection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
