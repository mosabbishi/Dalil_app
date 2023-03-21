import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_services.dart';

class HeaderUsername extends StatelessWidget {
  const HeaderUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FireStoreServices.userCollection
            .where('email', isEqualTo: AuthService.firebaseUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (AuthService.firebaseUser != null) {
            DocumentSnapshot docs = snapshot.data!.docs[0];
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'أهلا, ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    docs.get('username'),
                    style: const TextStyle(fontSize: 28),
                  ),
                ],
              ),
            );
          } else if (AuthService.firebaseUser == null) {
            return const Text('');
          }
          return const Center(
            child: Text('somthing went wrong'),
          );
        });
  }
}
