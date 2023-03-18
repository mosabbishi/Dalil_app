import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? password;
  final String? image;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.password,
    this.image,
  });

  toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
      "profile-image": image,
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot documentSnapshot) {
    return UserModel(
      id: documentSnapshot.id,
      username: documentSnapshot['user'],
      email: documentSnapshot['email'],
      phone: documentSnapshot['phone'],
      password: documentSnapshot['password'],
      image: documentSnapshot['profile-image'],
    );
  }
}
