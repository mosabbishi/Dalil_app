import 'package:flutter/material.dart';

import '../constant/styles.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    String location = 'موقعك الحالي';
    List<String> dropDownItems = [
      'موقعك الحالي',
      'جدة',
      'مكة',
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: DropdownButton(
        dropdownColor: Colors.grey[400],
        borderRadius: BorderRadius.circular(12.0),
        icon: const Icon(
          Icons.arrow_drop_down_circle_outlined,
          color: Colors.white,
        ),
        value: location,
        hint: Text(location),
        items: dropDownItems.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                item.toString(),
                style: Styles.appBarStyle,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            location = newValue!;
          });
        },
      ),
    );
  }
}
