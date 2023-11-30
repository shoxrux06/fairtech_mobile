// To parse this JSON data, do
//
//     final appealImageTypeResponse = appealImageTypeResponseFromJson(jsonString);

import 'dart:convert';

AppealImageTypeResponse appealImageTypeResponseFromJson(String str) => AppealImageTypeResponse.fromJson(json.decode(str));

String appealImageTypeResponseToJson(AppealImageTypeResponse data) => json.encode(data.toJson());

class AppealImageTypeResponse {
  List<ListElement> list;
  int total;

  AppealImageTypeResponse({
    required this.list,
    required this.total,
  });

  factory AppealImageTypeResponse.fromJson(Map<String, dynamic> json) => AppealImageTypeResponse(
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
  String nameUz;
  String nameLt;
  String nameRu;
  dynamic nameEn;
  String code;
  String type;
  int statusId;

  ListElement({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.code,
    required this.type,
    required this.statusId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ??0,
    nameUz: json["nameUz"]??'',
    nameLt: json["nameLt"] ??'',
    nameRu: json["nameRu"] ??'',
    nameEn: json["nameEn"],
    code: json["code"]??'',
    type: json["type"] ??'',
    statusId: json["statusId"] ??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUz": nameUz,
    "nameLt": nameLt,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "code": code,
    "type": type,
    "statusId": statusId,
  };
}
