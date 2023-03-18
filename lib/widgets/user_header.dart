import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../services/firestore_services.dart';

class HeaderAvatar extends StatelessWidget {
  const HeaderAvatar({
    Key? key,
  }) : super(key: key);

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
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    docs.get('profile-image'),
                  ),
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
