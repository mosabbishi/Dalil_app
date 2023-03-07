import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SuggestionServices {
  static CollectionReference suggestionsCollection =
      FirebaseFirestore.instance.collection('suggestions');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  static Future makeSuggestion(
      {required String id,
      required String name,
      required String type,
      required String address}) async {
    suggestionsCollection.doc().set({
      "id": id,
      "name": name,
      "type": type,
      "address": address,
    });
  }
}
