// To parse this JSON data, do
//
//     final appealTypeResponse = appealTypeResponseFromJson(jsonString);

import 'dart:convert';

AppealTypeResponse appealTypeResponseFromJson(String str) => AppealTypeResponse.fromJson(json.decode(str));

String appealTypeResponseToJson(AppealTypeResponse data) => json.encode(data.toJson());

class AppealTypeResponse {
  List<ListElement> list;
  int total;

  AppealTypeResponse({
    required this.list,
    required this.total,
  });

  factory AppealTypeResponse.fromJson(Map<String, dynamic> json) => AppealTypeResponse(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "total": total,
  };
}

class ListElement {
  int id;
  String nameLt;
  String nameUz;
  String nameRu;
  dynamic nameEn;
  String code;
  int statusId;

  ListElement({
    required this.id,
    required this.nameLt,
    required this.nameUz,
    required this.nameRu,
    required this.nameEn,
    required this.code,
    required this.statusId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    nameLt: json["nameLt"],
    nameUz: json["nameUz"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    code: json["code"],
    statusId: json["statusId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameLt": nameLt,
    "nameUz": nameUz,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "code": code,
    "statusId": statusId,
  };
}
