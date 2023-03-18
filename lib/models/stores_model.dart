import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Stores {
  String? name;
  String? type;
  String? address;
  LatLng? location;
  String? desc;
  String? headerImage;
  String? gallery;
  String? reviews;

  Stores(
    this.name,
    this.type,
    this.address,
    this.location,
    this.desc,
    this.headerImage,
    this.gallery,
    this.reviews,
  );

  Stores.fromJson(Map<String, dynamic> fromJson) {
    // fromJson = documentSnapshot; as DocumentSnapshot;
    // DocumentSnapshot documentSnapshot = Stores.fromJson();
    // return Stores(
    fromJson['name'];
    // name = documentSnapshot['name'],
    //   type = documentSnapshot['type'],
    //   address = documentSnapshot['address'],
    //   location = documentSnapshot['location'],
    //   desc = documentSnapshot['desc'],
    //   headerImage = documentSnapshot['header-image'],
    //   gallery = documentSnapshot['gallery'],
    // );
  }
}
