// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

// String welcomeToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.access_token,
    required this.token_type,
    required this.error,
    required this.statusCode,
  });

  String? access_token;
  String? token_type;
  String? error;
  int? statusCode;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        access_token: json["access_token"],
        token_type: json["token_type"],
        error: json["error"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "token_type": token_type,
        "error": error,
        "statusCode": statusCode,
      };
}
