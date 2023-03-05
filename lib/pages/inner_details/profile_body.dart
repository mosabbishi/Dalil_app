import 'package:dalil_app/pages/auth/sign_in/signin_page.dart';
import 'package:dalil_app/pages/inner_details/bookmarks.dart';
import 'package:dalil_app/pages/inner_details/reviews.dart';
import 'package:dalil_app/pages/inner_details/settings.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/widgets/profile_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTile(
          title: 'المعلومات الشخصية',
          lead: Icons.account_box,
          onTap: () => Get.to(() => const ProfileInfo()),
        ),
        ProfileTile(
          title: 'العلامات المرجعية',
          lead: Icons.bookmarks_rounded,
          onTap: () => Get.to(() => const Bookmarks()),
        ),
        ProfileTile(
          title: 'مراجعاتي',
          lead: Icons.chat,
          onTap: () => Get.to(() => const Reviews()),
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
          onTap: () => Get.to(() => const Settings()),
        ),
        ProfileTile(
          title: 'تسجيل الخروج',
          lead: Icons.logout,
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('تسجيل الخروج'),
              content: const Text('هل تريد تسجيل الخروج ؟'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              actions: [
                OutlinedButton(
                    onPressed: () {
                      AuthService().logOut();
                      Get.offAll(() => const SigninPage());
                    },
                    child: const Text('نعم')),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('إلغاء'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
