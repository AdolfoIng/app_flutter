import 'package:app_uber1/src/models/driver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DriverProvider {
  CollectionReference? _ref;

  DriverProvider() {
    _ref = FirebaseFirestore.instance.collection('Drivers');
  }

  Future create(Driver driver) {
    try {
      return _ref!.doc(driver.id).set(driver.toJson());
    } catch (e) {
      debugPrint('Error: $e');
      return Future.error(e);
    }
  }

  Future<Driver> getById(String id) async {
    DocumentSnapshot document = await _ref!.doc(id).get();
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    Driver driver = Driver.fromJsonLogin(data);
    return driver;
  }

  Future<bool> getByIdVerificar(String id) async {
    DocumentSnapshot document = await _ref!.doc(id).get();
    debugPrint('VERIFICANDO DRIVER .. ');

    if (document.data() == null) {
      return false;
    }
    return true;
  }
}
