import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dalil_app/utilities/search_bar.dart';
import 'package:flutter/material.dart';

import '../../utilities/back_button.dart';

class Buildings extends StatelessWidget {
  final String subTitle;
  const Buildings({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 7,
        child: Scaffold(
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
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: Text('ddd'),
              ),
              Tab(
                child: Text('ddd'),
              ),
              Tab(
                child: Text('ddd'),
              ),
              Tab(
                child: Text('ddd'),
              ),
              Tab(
                child: Text('ddd'),
              ),
              Tab(
                child: Text('ddd'),
              ),
              Tab(
                child: Text('ddd'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
