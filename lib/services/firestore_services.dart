import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/inner_details/stores_details.dart';
import '../widgets/stores_tile.dart';

class FireStoreServices {
  // Refrences
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  static CollectionReference storesCollection =
      FirebaseFirestore.instance.collection('stores');
  static CollectionReference suggestionsCollection =
      FirebaseFirestore.instance.collection('suggestions');
  static CollectionReference reviewsCollection =
      FirebaseFirestore.instance.collection('reviews');
  static CollectionReference bookmarksCollection =
      FirebaseFirestore.instance.collection('bookmarks');
  // all data from collection
  static all() {
    return StreamBuilder(
        stream: storesCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                DocumentSnapshot docs = snapshot.data!.docs[i];
                return StoreTile(
                  headerImage: docs['header-image'],
                  title: docs['name'],
                  subtitle: docs['type'],
                  address: docs['address'],
                  onTap: () {
                    Get.to(() => StoreDetails(
                          documentSnapshot: docs,
                        ));
                  },
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }
          if (!snapshot.hasData) {
            return const Text('no data yet');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(child: Text('Loading...'));
        });
  }

  // data based on type
  static type({required Object type}) {
    return StreamBuilder(
        stream: storesCollection.where('type', isEqualTo: type).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                DocumentSnapshot docs = snapshot.data!.docs[i];
                return StoreTile(
                  headerImage: docs['header-image'],
                  title: docs['name'],
                  subtitle: docs['type'],
                  address: docs['address'],
                  onTap: () {
                    Get.to(() => StoreDetails(
                          documentSnapshot: docs,
                        ));
                  },
                );
              },
            );
          } else if (!snapshot.hasData) {
            return const Center(
                child: Icon(
              Icons.close_sharp,
              size: 50,
            ));
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          }

          return const Center(child: Text('Loading...'));
        });
  }

  //
  static Future<void> makeSuggestion(
      {required String id,
      required String name,
      required String type,
      required String address}) async {
    await suggestionsCollection.add({
      makeSuggestion(
        id: id,
        name: name,
        type: type,
        address: address,
      ),
    });
  }

  static Future deleteReview(id) async {
    reviewsCollection.doc(id).delete();
  }

  static Future updateDocument({
    id,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    FireStoreServices.userCollection.doc(id).update({
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
  }

  static Future addToBookmarks({
    id,
    required String name,
    required String type,
    required String address,
    required String user,
    required String image,
    required GeoPoint location,
  }) async {
    FireStoreServices.bookmarksCollection.add({
      "username": user,
      "header-image": image,
      "name": name,
      "type": type,
      "address": address,
      "location": location,
    });
  }

  static Future addToUserProfile({required id, required String image}) async {
    await userCollection.doc(id).update({
      "profile-image": image,
    });
  }
}
