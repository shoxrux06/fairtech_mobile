// To parse this JSON data, do
//
//     final oneProductAllSumsResponse = oneProductAllSumsResponseFromJson(jsonString);

import 'dart:convert';

OneProductAllSumsResponse oneProductAllSumsResponseFromJson(String str) => OneProductAllSumsResponse.fromJson(json.decode(str));

class OneProductAllSumsResponse {
  ProductSum all;
  ProductSum market1;
  ProductSum market2;
  ProductSum market3;

  OneProductAllSumsResponse({
    required this.all,
    required this.market1,
    required this.market2,
    required this.market3,
  });

  factory OneProductAllSumsResponse.fromJson(Map<String, dynamic> json) => OneProductAllSumsResponse(
    all: ProductSum.fromJson(json["all"]),
    market1: (json["market1"] == null) ? ProductSum.fromJson({}): ProductSum.fromJson(json["market1"]),
    market2: (json["market2"] == null) ? ProductSum.fromJson({}): ProductSum.fromJson(json["market2"]),
    market3:( json["market3"] == null) ? ProductSum.fromJson({}): ProductSum.fromJson(json["market3"]),
  );
}

class ProductSum {
  num? minSum;
  num? maxSum;
  num? middleSum;
  Region? maxRegion;
  Region? minRegion;

  ProductSum({
    required this.minSum,
    required this.maxSum,
    required this.middleSum,
    required this.maxRegion,
    required this.minRegion,
  });

  factory ProductSum.fromJson(Map<String, dynamic> json) => ProductSum(
    minSum: json["minSum"],
    maxSum: json["maxSum"] ,
    middleSum: json["middleSum"],
    maxRegion: json["maxRegion"] == null ? null : Region.fromJson(json["maxRegion"]),
    minRegion: json["minRegion"] == null ? null : Region.fromJson(json["minRegion"]),
  );
}

class Region {
  int id;
  String nameUz;
  String nameLt;
  String nameRu;

  Region({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"] ??0,
    nameUz: json["nameUz"] ??'',
    nameLt: json["nameLt"] ??'',
    nameRu: json["nameRu"] ??'',
  );

}
