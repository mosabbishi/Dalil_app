import 'package:dalil_app/constant/constants.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/models/pageView_model.dart';
import 'package:dalil_app/pages/inner_details/suggeestion_page.dart';
import 'package:dalil_app/utilities/search_bar.dart';
import 'package:dalil_app/widgets/header_username.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/indicator.dart';
import '../../widgets/page_view_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isActive = true;
  int _selectedIndex = 0;
  final pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            mainPageheader(),
            //
            const HeaderUsername(),
            // pageview
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size * 0.2,
                    child: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: pageViewItems.length,
                      itemBuilder: (context, index) {
                        return PageViewItem(
                          title: pageViewItems[index].title,
                          content: pageViewItems[index].content,
                          image: pageViewItems[index].image,
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                  // indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        pageViewItems.length,
                        (index) => Indicator(
                          isActive: _selectedIndex == index ? true : false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //
            const SearchBar(),
            //
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Text(
                'التصنيفات الرئيسية',
                style: TextStyle(
                  color: Styles.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
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
      ),
    );
  }
}

//
buildCategory({required double height}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SizedBox(
      height: height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 200,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: Constants.mainCategoriesMap.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () => Get.to(Constants.mainCategoriesMap[index]['route']),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: Constants.mainCategoriesMap[index]['image']
                          .toString(),
                      height: 177,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 177,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color.fromRGBO(0, 0, 0, 0.44),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      Constants.mainCategoriesMap[index]['title'],
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Styles.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}

mainPageheader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu_rounded,
          size: 40,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Styles.red),
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Image.asset(
            'assets/pics/man.png',
            height: 55,
          ),
        ),
      ],
    ),
  );
}
