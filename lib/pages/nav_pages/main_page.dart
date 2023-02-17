import 'package:dalil_app/constant/constants.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/drop_down_btn.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // String location = 'موقعك الحالي';
  // List<String> dropDownItems = [
  //   'موقعك الحالي',
  //   'جدة',
  //   'مكة',
  // ];
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
              Container(
                height: size * 0.14,
                width: double.infinity,
                color: Colors.amberAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'أهلا, مصعب',
                            style: Styles().appBarStyle,
                          ),
                          // note: the current location doesnt display
                          const DropDownWidget(),
                        ],
                      ),
                      const Icon(
                        Icons.safety_check,
                        color: Colors.white,
                        size: 34,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              //
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: size * 0.5,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    itemCount: Constants().mainCategoriesMap.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Get.to(
                            Constants().mainCategoriesMap[index]['route']),
                        child: Container(
                          decoration: Styles().categoriesDecoration,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Constants().mainCategoriesMap[index]['icon'],
                              Text(
                                Constants().mainCategoriesMap[index]['title'],
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                              ),
                            ],
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
