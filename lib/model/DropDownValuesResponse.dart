// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:otms/model/PhoneExtensionInfo.dart';

DropDownValuesResponse dropDownValuesResponseFromJson(String str) =>
    DropDownValuesResponse.fromJson(json.decode(str));

class DropDownValuesResponse {
  DropDownValuesResponse({
    required this.extensions,
    required this.countries,
    required this.currencies,
    this.error,
    this.statusCode,
  });

  List<PhoneExtensionInfo>? extensions;
  List<String>? countries;
  List<String>? currencies;
  int? statusCode;
  String? error;

  DropDownValuesResponse.fromJson(Map<String, dynamic> json) {
    if (json['extensions'] != null) {
      extensions = [];
      json['extensions'].forEach((v) {
        extensions?.add(PhoneExtensionInfo.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = [];
      json['countries'].forEach((v) {
        countries?.add(v.toString());
      });
    }
    if (json['currencies'] != null) {
      currencies = [];
      json['currencies'].forEach((v) {
        currencies?.add(v.toString());
      });
    }
    error: json['error'];
    statusCode: json["statusCode"];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['extensions'] = extensions?.map((v) => v.toJson()).toList();
    map['countries'] = countries?.map((v) => v).toList();
    map['currencies'] = currencies?.map((v) => v).toList();
    map['error'] = error;
    map['statusCode'] = statusCode;
    return map;
  }
}
