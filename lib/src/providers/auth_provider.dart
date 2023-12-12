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

  bool isSignedIn() {
    final currentUser = _firebaseAuth!.currentUser;

    if (currentUser == null) {
      return false;
    }

    return true;
  }

  checkUserIsLogged(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        debugPrint('Esta LOGEADO');

        Navigator.pushNamedAndRemoveUntil(
            context, 'client/map', (route) => false);

        /*if (typeUser == 'client') {
          Navigator.pushNamedAndRemoveUntil(
              context, 'client/map', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, 'driver/map', (route) => false);
        }*/
      } else {
        debugPrint('No esta LOGEADO');
      }
    });
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

  Future<dynamic> signOut() async {
    return Future.wait([_firebaseAuth!.signOut()]);
  }
}
