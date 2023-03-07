import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/inner_details/profile_body.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/utilities/back_button.dart';
import 'package:flutter/material.dart';

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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: FutureBuilder(
          future: FireStoreServices.userCollection
              .where('email', isEqualTo: AuthService.firebaseUser!.email)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Styles.red,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                    height: 190,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        return UserData(
                          username: snapshot.data!.docs[i]['username'],
                          email: snapshot.data!.docs[i]['email'],
                          phone: snapshot.data!.docs[i]['phone'],
                        );
                      },
                    ),
                  ),
                  //
                  ProfileBody(),
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
