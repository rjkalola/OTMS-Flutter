// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str, bool isSuccess) =>
    LoginResponse.fromJson(json.decode(str));

String welcomeToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.access_token,
    required this.token_type,
  });

  String? access_token;
  String? token_type;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        access_token: json["access_token"],
        token_type: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "token_type": token_type,
      };
}
