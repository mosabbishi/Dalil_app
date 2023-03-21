import 'package:dalil_app/constant/constants.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/models/pageView_model.dart';
import 'package:dalil_app/pages/inner_details/suggeestion_page.dart';
import 'package:dalil_app/pages/nav_pages/search_page.dart';
import 'package:dalil_app/widgets/header_username.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/indicator.dart';
import '../../widgets/page_view_item.dart';
import '../../widgets/user_header.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 
  var data = 'حدد موقعك من هنا';
  bool isActive = true;
  int _selectedIndex = 0;
  final TextEditingController _userlocctrl = TextEditingController();
  final pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mainPageheader(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      getPosition();
                    },
                    icon: const Icon(Icons.my_location),
                  ),
                  Text(
                    data,
                  ),
                ],
              ),
              // pageview
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: size * 0.25,
                      child: PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: pageViewItems.length,
                        itemBuilder: (context, index) {
                          var _scale = _selectedIndex == index ? 1.0 : 7.0;
                          var item = pageViewItems[index];
                          return PageViewItem(
                            // fromBottom: _selectedIndex == index ? 0 : 30,
                            pageViewModel: item,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
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
                    ),
                  ],
                ),
              ),
              //
              searchBar(),
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
        ),
      ),
    );
  }

//
  determinePosition() async {
    bool serviceEabled;
    LocationPermission permission;
    // is the location service enabled?
    serviceEabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEabled) {
      return Future.error('error');
    }

    // check if the location service is enabled or not
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('denied');
      }
    }
    // manually enable the location services from settings
    if (permission == LocationPermission.deniedForever) {
      return Future.error('denied forever');
    }
    //
    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  void getPosition() async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      Position datas = await determinePosition();
      getAddresFromLatLong(datas);
    }
  }

  void getAddresFromLatLong(Position datas) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(datas.latitude, datas.longitude);
    Placemark place = placemark[0];
    var address = '${place.locality},${place.subLocality}';
    setState(() {
      data = address;
    });
  }
}

//
Widget buildCategory({required double height}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SizedBox(
      height: height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 125,
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
                    borderRadius: BorderRadius.circular(10.0),
                    child: FancyShimmerImage(
                      imageUrl: Constants.mainCategoriesMap[index]['image']
                          .toString(),
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color.fromRGBO(0, 0, 0, 0.7),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      Constants.mainCategoriesMap[index]['title'],
                      textAlign: TextAlign.center,
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

//
Widget mainPageheader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const HeaderUsername(),
          ],
        )),
        const Spacer(flex: 1),
        const HeaderAvatar(),
      ],
    ),
  );
}

//
Widget searchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: GestureDetector(
      onTap: () {
        Get.to(() => const SearchPage());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey[400],
        ),
        width: double.infinity,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Styles.white,
              ),
              const SizedBox(width: 5.0),
              Text(
                'بحث',
                style: TextStyle(color: Styles.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
