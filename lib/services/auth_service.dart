import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static User? firebaseUser = FirebaseAuth.instance.currentUser;
  final firebaseAuth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
// create new user
  Future<void> registerNewUser(
      {required String email, required String name, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      e.code;
    }
  }

  Future<void> createUser(UserModel user) async {
    await _db.collection('users').add(user.toJson());
  }

// signin user
  Future<void> signinUser(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      e.code;
    }
  }

//
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }
}
