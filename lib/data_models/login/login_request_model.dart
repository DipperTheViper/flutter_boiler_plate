// To parse this JSON data, do
//
//     final loginReqModel = loginReqModelFromMap(jsonString);

import 'dart:convert';

LoginReqModel loginReqModelFromMap(String str) =>
    LoginReqModel.fromMap(json.decode(str));

String loginReqModelToMap(LoginReqModel data) => json.encode(data.toMap());

class LoginReqModel {
  LoginReqModel({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory LoginReqModel.fromMap(Map<String, dynamic> json) => LoginReqModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
      };
}
