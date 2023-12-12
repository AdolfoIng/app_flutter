import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future<dynamic> save(String key, String value) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString(key, jsonEncode(value));
  }

  Future<dynamic> read(String key) async {
    final preference = await SharedPreferences.getInstance();

    if (preference.getString(key) == null) {
      return null;
    }
    final String? action = preference.getString(key);
    return jsonDecode(action.toString());
  }

  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}
