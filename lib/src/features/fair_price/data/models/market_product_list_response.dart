// To parse this JSON data, do
//
//     final marketProductListResponse = marketProductListResponseFromJson(jsonString);

import 'dart:convert';

List<MarketProductListResponse> marketProductListResponseFromJson(String str) => List<MarketProductListResponse>.from(json.decode(str).map((x) => MarketProductListResponse.fromJson(x)));

class MarketProductListResponse {
  int id;
  String nameUz;
  String nameLt;
  String nameRu;
  dynamic nameEn;
  dynamic photoPng;
  PhotoSvg photoSvg;
  dynamic marketId;
  String code;
  dynamic statusId;
  dynamic measureId;
  dynamic parentId;
  int maxSum;
  int minSum;
  int middleSum;
  MeasureDto measureDto;
  dynamic parentDto;
  List<MarketProductListResponse> children;
  List<dynamic> marketForSets;
  List<dynamic> priceUserIds;

  MarketProductListResponse({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.photoPng,
    required this.photoSvg,
    required this.marketId,
    required this.code,
    required this.statusId,
    required this.measureId,
    required this.parentId,
    required this.maxSum,
    required this.minSum,
    required this.middleSum,
    required this.measureDto,
    required this.parentDto,
    required this.children,
    required this.marketForSets,
    required this.priceUserIds,
  });

  factory MarketProductListResponse.fromJson(Map<String, dynamic> json) => MarketProductListResponse(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    photoPng: json["photoPng"],
    photoSvg: PhotoSvg.fromJson(json["photoSvg"]),
    marketId: json["marketId"],
    code: json["code"],
    statusId: json["statusId"],
    measureId: json["measureId"],
    parentId: json["parentId"],
    maxSum: json["maxSum"],
    minSum: json["minSum"],
    middleSum: json["middleSum"],
    measureDto: MeasureDto.fromJson(json["measureDto"]),
    parentDto: json["parentDto"],
    children: List<MarketProductListResponse>.from(json["children"].map((x) => x)),
    marketForSets: List<dynamic>.from(json["marketForSets"].map((x) => x)),
    priceUserIds: List<dynamic>.from(json["priceUserIds"].map((x) => x)),
  );

}

class MeasureDto {
  int id;
  String nameUz;
  String nameLt;
  String nameRu;
  dynamic nameEn;
  int statusId;

  MeasureDto({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.statusId,
  });

  factory MeasureDto.fromJson(Map<String, dynamic> json) => MeasureDto(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    statusId: json["statusId"],
  );
}

class PhotoSvg {
  int id;
  int size;
  String name;
  dynamic modifiedFileName;
  String fileExtension;
  String uploadPath;
  dynamic absolutePath;
  dynamic originalName;
  dynamic mimeType;

  PhotoSvg({
    required this.id,
    required this.size,
    required this.name,
    required this.modifiedFileName,
    required this.fileExtension,
    required this.uploadPath,
    required this.absolutePath,
    required this.originalName,
    required this.mimeType,
  });

  factory PhotoSvg.fromJson(Map<String, dynamic> json) => PhotoSvg(
    id: json["id"],
    size: json["size"],
    name: json["name"],
    modifiedFileName: json["modifiedFileName"],
    fileExtension: json["fileExtension"],
    uploadPath: json["uploadPath"],
    absolutePath: json["absolutePath"],
    originalName: json["originalName"],
    mimeType: json["mimeType"],
  );
}
