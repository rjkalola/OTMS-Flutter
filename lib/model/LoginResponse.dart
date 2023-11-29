// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

// String welcomeToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.access_token,
    this.token_type,
    this.error,
    this.detail,
    this.statusCode,
  });

  String? access_token;
  String? token_type;
  String? error;
  String? detail;
  int? statusCode;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        access_token: json["access_token"],
        token_type: json["token_type"],
        error: json["error"],
        detail: json["detail"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "token_type": token_type,
        "error": error,
        "detail": detail,
        "statusCode": statusCode,
      };
}
