import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../services/firestore_services.dart';

class HeaderWelcome extends StatelessWidget {
  const HeaderWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FireStoreServices.userCollection
            .where('email', isEqualTo: AuthService.firebaseUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (AuthService.firebaseUser != null) {
            return SizedBox(
              height: 65,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 12.0),
                    child: Row(
                      children: [
                        const Text(
                          'Hello,',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          snapshot.data!.docs[index]['username'],
                          style: const TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (AuthService.firebaseUser == null) {
            return const Text('f');
          }
          return const Center(
            child: Text('somthing went wrong'),
          );
        });
  }
}
