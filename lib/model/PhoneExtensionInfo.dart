// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PhoneExtensionInfo phoneExtensionInfoFromJson(String str) =>
    PhoneExtensionInfo.fromJson(json.decode(str));

class PhoneExtensionInfo {
  PhoneExtensionInfo({
    this.id,
    this.extension,
    this.flag,
    this.position,
  });

  String? id;
  String? extension;
  String? flag;
  int? position;

  factory PhoneExtensionInfo.fromJson(Map<String, dynamic> json) =>
      PhoneExtensionInfo(
        id: json["id"],
        extension: json["extension"],
        flag: json["flag"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "extension": extension,
        "flag": flag,
        "position": position,
      };
}
