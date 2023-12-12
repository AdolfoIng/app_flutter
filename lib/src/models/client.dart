import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
  String id;
  String username;
  String email;
  String? password;

  Client({
    required this.id,
    required this.username,
    required this.email,
    this.password,
  });

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  factory Client.fromJsonLogin(Map<String, dynamic> json) => Client(
        id: json["id"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
      };
}
