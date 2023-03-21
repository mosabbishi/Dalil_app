import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_services.dart';

class HeaderAvatar extends StatefulWidget {
  const HeaderAvatar({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderAvatar> createState() => _HeaderAvatarState();
}

class _HeaderAvatarState extends State<HeaderAvatar> {
  bool isExist = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FireStoreServices.userCollection
            .where('email', isEqualTo: AuthService.firebaseUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          DocumentSnapshot docs = snapshot.data!.docs[0];
          if (snapshot.hasData) {
            return Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
              ),
              child: isExist
                  ? Icon(
                      Icons.no_photography,
                      size: 40,
                      color: Styles.white,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: FancyShimmerImage(
                        imageUrl: snapshot.data!.docs[0]['profile-image'],
                        boxFit: BoxFit.cover,
                        errorWidget: const Icon(Icons.abc),
                      ),
                    ),
            );
          } else if (!snapshot.hasData) {
            return const Placeholder(
              child: Text('data'),
            );
          }
          return const Center();
        });
  }
}
