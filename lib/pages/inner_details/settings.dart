import 'package:dalil_app/utilities/back_button.dart';
import 'package:dalil_app/widgets/profile_tiles.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackBtn(),
          title: const Text('الإعدادات'),
        ),
        body: Column(children: [
          ProfileTile(
            title: 'حول',
            lead: Icons.info_outline,
            onTap: () {},
          ),
          ProfileTile(
            title: 'التسجيل كمالك او مزود خدمة',
            lead: Icons.add_business,
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
