import 'package:dalil_app/pages/inner_details/profile_body.dart';
import 'package:dalil_app/pages/inner_details/profile_header.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double size = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: const [
                ProfileHeader(),
                SizedBox(height: 20),
                //
                ProfileBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
