// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());

class Driver {
  String id;
  String username;
  String email;
  String password;
  String placa;

  Driver({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.placa,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        placa: json["placa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "placa": placa,
      };
}
