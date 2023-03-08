import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_services.dart';

class HeaderUsername extends StatelessWidget {
  const HeaderUsername({
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
              // height: 65,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, bottom: 12.0, top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello,',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          snapshot.data!.docs[index]['username'],
                          style: const TextStyle(fontSize: 28),
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
