// To parse this JSON data, do
//
//     final marketProductListResponse = marketProductListResponseFromJson(jsonString);

import 'dart:convert';

List<MarketProductListEntity> marketProductListResponseFromJson(String str) => List<MarketProductListEntity>.from(json.decode(str).map((x) => MarketProductListEntity.fromJson(x)));

class MarketProductListEntity {
  int? id;
  String? nameUz;
  String? nameLt;
  String? nameRu;
  PhotoSvg photoSvg;
  PhotoSvg photoPng;
  String? code;
  String? codeOther;
  num? maxSum;
  num? minSum;
  num? middleSum;
  List<MarketProductListEntity> children;

  MarketProductListEntity({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.photoSvg,
    required this.photoPng,
    required this.code,
    required this.codeOther,
    required this.maxSum,
    required this.minSum,
    required this.middleSum,
    required this.children,
  });

  factory MarketProductListEntity.fromJson(Map<String, dynamic> json) => MarketProductListEntity(
    id: json["id"]??0,
    nameUz: json["nameUz"] ?? '',
    nameLt: json["nameLt"] ??'',
    nameRu: json["nameRu"] ??'',
    photoSvg: json["photoSvg"] != null?PhotoSvg.fromJson(json["photoSvg"]):PhotoSvg.fromJson({}),
    photoPng: json["photoPng"] != null?PhotoSvg.fromJson(json["photoPng"]):PhotoSvg.fromJson({}),
    code: json["code"] ?? '',
    codeOther: json["codeOther"] ?? '',
    maxSum: json["maxSum"] ?? 0,
    minSum: json["minSum"] ?? 0,
    middleSum: json["middleSum"] ??0,
    children: List<MarketProductListEntity>.from(json["children"].map((x) => MarketProductListEntity.fromJson(x))),
  );

}

class PhotoSvg {
  int id;
  int size;
  String name;
  String fileExtension;
  String uploadPath;
  String absolutePath;

  PhotoSvg({
    required this.id,
    required this.size,
    required this.name,
    required this.fileExtension,
    required this.uploadPath,
    required this.absolutePath,
  });

  factory PhotoSvg.fromJson(Map<String, dynamic> json) => PhotoSvg(
    id: json["id"] ?? 0,
    size: json["size"] ??0,
    name: json["name"] ??'',
    fileExtension: json["fileExtension"] ??'',
    uploadPath: json["uploadPath"] ??'',
    absolutePath: json["absolutePath"] ??'',
  );
}
