import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/nav_pages/search_page.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: CupertinoSearchTextField(
        placeholder: 'بحث',
        placeholderStyle: const TextStyle(color: Colors.white),
        itemColor: Colors.white,
        onTap: () => Get.to(() => const SearchPage()),
      ),
    );
  }
}
