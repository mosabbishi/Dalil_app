import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/utilities/back_button.dart';
import 'package:dalil_app/widgets/no_review.dart';
import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  Reviews({super.key});

  final List<String> popUpList = ['delete'];

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackBtn(),
          title: const Text('مراجعاتي'),
        ),
        body: StreamBuilder(
            stream: FireStoreServices.reviewsCollection
                .where('username', isEqualTo: AuthService.firebaseUser!.email)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const NoReviews()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 12.0),
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        DocumentSnapshot docs = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  blurStyle: BlurStyle.outer,
                                  spreadRadius: 5.0,
                                  color: Colors.grey.shade400,
                                ),
                              ],
                            ),
                            child: reviewList(
                              username: docs['username'],
                              store: docs['store'],
                              content: docs['content'],
                              onTap: () =>
                                  FireStoreServices.deleteReview(docs.id),
                            ),
                          ),
                        );
                      },
                    );
            }),
      ),
    );
  }

  Widget reviewList({
    required String username,
    required String store,
    required String content,
    required Function() onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      tileColor: Colors.white,
      leading: const CircleAvatar(
        radius: 40,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
          ),
          Text(
            'رد الى: $store',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Text(content),
      trailing: PopupMenuButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.grey[300],
        itemBuilder: (context) => popUpList
            .map(
              (item) => PopupMenuItem(
                onTap: onTap,
                child: Text(item),
              ),
            )
            .toList(),
      ),
    );
  }
}
