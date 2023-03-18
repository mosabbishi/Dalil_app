import 'dart:io';

import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/inner_details/profile_body.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String imageUrl = '';

  void uploadImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    Reference ref = FirebaseStorage.instance.ref().child('users/man.png');
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      setState(() {
        imageUrl = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: StreamBuilder(
          stream: FireStoreServices.userCollection
              .where('email', isEqualTo: AuthService.firebaseUser!.email)
              .get()
              .asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Styles.red,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 30.0),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 140,
                                    width: 140,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Styles.white, width: 2.0),
                                    ),
                                    child: Container(
                                      height: 110,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Styles.black,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            snapshot.data!.docs[0]
                                                .get('profile-image'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 15.0,
                                    child: InkWell(
                                      onTap: () {
                                        uploadImage();
                                        FireStoreServices.addToUserProfile(
                                          id: snapshot.data!.docs[0].id,
                                          image: imageUrl.toString(),
                                        );
                                      },
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Styles.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //name and email
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data!.docs[0].get('username'),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Styles.white,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Text(
                                  snapshot.data!.docs[0].get('email'),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Styles.white,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const ProfileBody(),
                ],
              );

              //     // disable notifications
              //     // contact us
              //   ],
              // );
            }
            return const Center();
          },
        ),
      ),
    );
  }
}
