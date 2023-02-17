import 'package:dalil_app/widgets/profile_tiles.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTile(
          title: 'المعلومات الشخصية',
          lead: Icons.account_box,
          onTap: () {},
        ),
        ProfileTile(
          title: 'العلامات المرجعية',
          lead: Icons.bookmarks_rounded,
          onTap: () {},
        ),
        ProfileTile(
          title: 'مراجعاتي',
          lead: Icons.chat,
          onTap: () {},
        ),
        ProfileTile(
          title: 'اللغة',
          lead: Icons.translate,
          onTap: () {},
        ),
        ProfileTile(
          title: 'المظهر',
          lead: Icons.nights_stay,
          onTap: () {},
        ),
        ProfileTile(
          title: 'الإعدادات',
          lead: Icons.settings,
          onTap: () {},
        ),
        ProfileTile(
          title: 'تسجيل الخروج',
          lead: Icons.logout,
          onTap: () {},
        ),
      ],
    );
  }
}
