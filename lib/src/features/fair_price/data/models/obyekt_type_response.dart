// To parse this JSON data, do
//
//     final obyektTypeResponse = obyektTypeResponseFromJson(jsonString);

import 'dart:convert';

ObyektTypeResponse obyektTypeResponseFromJson(String str) => ObyektTypeResponse.fromJson(json.decode(str));

String obyektTypeResponseToJson(ObyektTypeResponse data) => json.encode(data.toJson());

class ObyektTypeResponse {
  List<ListElement> list;
  int total;

  ObyektTypeResponse({
    required this.list,
    required this.total,
  });

  factory ObyektTypeResponse.fromJson(Map<String, dynamic> json) => ObyektTypeResponse(
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
  String type;
  int statusId;

  ListElement({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.type,
    required this.statusId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    type: json["type"],
    statusId: json["statusId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUz": nameUz,
    "nameLt": nameLt,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "type": type,
    "statusId": statusId,
  };
}
