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
}
