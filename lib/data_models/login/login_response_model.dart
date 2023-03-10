// To parse this JSON data, do
//
//     final loginReqModel = loginReqModelFromMap(jsonString);

import 'dart:convert';

LoginReqModel loginReqModelFromMap(String str) =>
    LoginReqModel.fromMap(json.decode(str));

String loginReqModelToMap(LoginReqModel data) => json.encode(data.toMap());

class LoginReqModel {
  LoginReqModel({
    required this.token,
    required this.expireTime,
  });

  String token;
  double expireTime;

  factory LoginReqModel.fromMap(Map<String, dynamic> json) => LoginReqModel(
        token: json["token"],
        expireTime: json["expire_time"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "expire_time": expireTime,
      };
}
