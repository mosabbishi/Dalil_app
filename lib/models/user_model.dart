import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? username;
  late final String? email;
  final String? phone;
  final String? password;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.password,
  });

  toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot documentSnapshot) {
    return UserModel(
      id: documentSnapshot.id,
      username: documentSnapshot['user'],
      email: documentSnapshot['email'],
      phone: documentSnapshot['phone'],
      password: documentSnapshot['password'],
    );
  }
}
