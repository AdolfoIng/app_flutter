import 'package:app_uber1/src/models/client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientProvider {
  CollectionReference? _ref;

  ClientProvider() {
    _ref = FirebaseFirestore.instance.collection('Clients');
  }

  Future create(Client client) {
    try {
      return _ref!.doc(client.id).set(client.toJson());
    } catch (e) {
      debugPrint('Error: $e');
      return Future.error(e);
    }
  }
}
