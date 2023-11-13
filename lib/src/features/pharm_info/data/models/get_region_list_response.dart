// To parse this JSON data, do
//
//     final getRegionListResponse = getRegionListResponseFromJson(jsonString);

import 'dart:convert';

List<GetRegionListResponse> getRegionListResponseFromJson(String str) => List<GetRegionListResponse>.from(json.decode(str).map((x) => GetRegionListResponse.fromJson(x)));

String getRegionListResponseToJson(List<GetRegionListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetRegionListResponse {
  int id;
  String nameUz;
  String nameLt;
  String nameRu;
  dynamic nameEn;
  int soato;
  dynamic parentId;

  GetRegionListResponse({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.soato,
    required this.parentId,
  });

  factory GetRegionListResponse.fromJson(Map<String, dynamic> json) => GetRegionListResponse(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    soato: json["soato"],
    parentId: json["parentId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUz": nameUz,
    "nameLt": nameLt,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "soato": soato,
    "parentId": parentId,
  };
}
