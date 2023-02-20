import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../pages/inner_details/stores_tile.dart';

class FireStoreServices {
  // Refrences
  CollectionReference ref = FirebaseFirestore.instance.collection('data');
  // all data from collection
  all() {
    return StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                return StoreTile(
                  title: snapshot.data!.docs[i]['name'],
                  subtitle: snapshot.data!.docs[i]['name'],
                  onTap: () {},
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
  //
}
