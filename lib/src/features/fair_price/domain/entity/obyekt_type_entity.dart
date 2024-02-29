// To parse this JSON data, do
//
//     final obyektTypeResponse = obyektTypeResponseFromJson(jsonString);

import 'dart:convert';

ObyektTypeEntity obyektTypeResponseFromJson(String str) => ObyektTypeEntity.fromJson(json.decode(str));

class ObyektTypeEntity {
  List<ListElement> list;
  int total;

  ObyektTypeEntity({
    required this.list,
    required this.total,
  });

  factory ObyektTypeEntity.fromJson(Map<String, dynamic> json) => ObyektTypeEntity(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    total: json["total"],
  );
}

class ListElement {
  int id;
  String nameLt;
  String type;
  int statusId;

  ListElement({
    required this.id,
    required this.nameLt,
    required this.type,
    required this.statusId,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    nameLt: json["nameLt"],
    type: json["type"],
    statusId: json["statusId"],
  );

}
