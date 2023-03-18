import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/pages/inner_details/stores_details.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/utilities/back_button.dart';
import 'package:dalil_app/widgets/bookmark_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackBtn(),
          title: const Text('العلامات المرجعية'),
        ),
        //
        body: StreamBuilder(
          stream: FireStoreServices.bookmarksCollection
              .where('username', isEqualTo: AuthService.firebaseUser!.email)
              .snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot docs = snapshot.data!.docs[index];
                        return BookmarksBox(
                          image: docs['header-image'],
                          title: docs['name'],
                          address: docs['address'],
                          function: () {},
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text('no bookmarks'),
                  );
          },
        ),
      ),
    );
  }
}
