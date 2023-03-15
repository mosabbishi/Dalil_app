import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/inner_details/profile_body.dart';
import 'package:dalil_app/pages/inner_details/profile_info.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/utilities/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/user_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.red,
          elevation: 0.0,
        ),
        body: StreamBuilder(
          stream: FireStoreServices.userCollection
              .where('email', isEqualTo: AuthService.firebaseUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Styles.red,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                        bottomRight: Radius.circular(100.0),
                      ),
                    ),
                    height: 190,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[i];

                        return UserData(
                          username: documentSnapshot['username'],
                          email: documentSnapshot['email'],
                        );
                      },
                    ),
                  ),
                  //
                  ProfileBody(
                    function: () {
                      Get.to(() =>
                          ProfileInfo());
                    },
                  ),
                ],
              );
            }
            return const Center();
          },
        ),
      ),
    );
  }
}
