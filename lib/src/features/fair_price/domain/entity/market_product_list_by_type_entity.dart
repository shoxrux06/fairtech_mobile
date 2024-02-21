// To parse this JSON data, do
//
//     final marketProductListByTypeResponse = marketProductListByTypeResponseFromJson(jsonString);

import 'dart:convert';

MarketProductListByTypeEntity marketProductListByTypeResponseFromJson(String str) => MarketProductListByTypeEntity.fromJson(json.decode(str));

class MarketProductListByTypeEntity {
  int? id;
  String nameUz;
  String nameLt;
  String nameRu;
  String? nameEn;
  dynamic marketId;
  int? statusId;
  int? measureId;
  int? parentId;
  Photo? photoPng;
  Photo? photoSvg;
  MarketProductListByTypeEntity? parentDto;
  List<MarketProductListByTypeEntity> children;

  MarketProductListByTypeEntity({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.marketId,
    required this.statusId,
    required this.measureId,
    required this.parentId,
    required this.photoPng,
    required this.photoSvg,
    required this.parentDto,
    required this.children,
  });

  factory MarketProductListByTypeEntity.fromJson(Map<String, dynamic> json) => MarketProductListByTypeEntity(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    marketId: json["marketId"],
    statusId: json["statusId"],
    measureId: json["measureId"],
    parentId: json["parentId"],
    photoPng: json["photoPng"] == null ? null : Photo.fromJson(json["photoPng"]),
    photoSvg: json["photoSvg"] == null ? null : Photo.fromJson(json["photoSvg"]),
    parentDto: json["parentDto"] == null ? null : MarketProductListByTypeEntity.fromJson(json["parentDto"]),
    children: List<MarketProductListByTypeEntity>.from(json["children"].map((x) => MarketProductListByTypeEntity.fromJson(x))),
  );

}


class Photo {
  int id;
  int size;
  String name;
  String uploadPath;

  Photo({
    required this.id,
    required this.size,
    required this.name,
    required this.uploadPath,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    size: json["size"],
    name: json["name"],
    uploadPath: json["uploadPath"],
  );

}

