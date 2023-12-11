import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  FirebaseAuth? _firebaseAuth;

  AuthProvider() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  User getUser() {
    return _firebaseAuth!.currentUser!;
  }

  Future<bool> login(String email, String password) async {
    try {
      await _firebaseAuth!
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      debugPrint('Error mtd Login : $error \n ${error.toString()}');
      return false;
    }

    return true;
  }

  Future<bool> register(String email, String password) async {
    try {
      await _firebaseAuth!
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      debugPrint('Error mtd Login : $error \n ${error.toString()}');
      return false;
    }

    return true;
  }
}
