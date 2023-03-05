import 'package:dalil_app/pages/nav_pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../constant/styles.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                style: Styles.appBarStyle,
              ),
              // note: the current location doesnt display
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: IconButton(
                onPressed: () => Get.to(() => const SearchPage()),
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.amberAccent,
                )),
          )
        ],
      ),
    );
  }
}
