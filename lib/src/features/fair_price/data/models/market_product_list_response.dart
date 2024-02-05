// To parse this JSON data, do

import 'dart:convert';

MarketProductListResponse marketProductListResponseFromJson(String str) => MarketProductListResponse.fromJson(json.decode(str));

class MarketProductListResponse {
  int? id;
  String nameUz;
  String nameLt;
  String nameRu;
  String? nameEn;
  int? marketId;
  int? statusId;
  int? measureId;
  int? parentId;
  MeasureDto? measureDto;
  MarketProductListResponse? parentDto;
  List<MarketProductListResponse> children;

  MarketProductListResponse({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.marketId,
    required this.statusId,
    required this.measureId,
    required this.parentId,
    required this.measureDto,
    required this.parentDto,
    required this.children,
  });

  factory MarketProductListResponse.fromJson(Map<String, dynamic> json) => MarketProductListResponse(
    id: json["id"] ?? 0,
    nameUz: json["nameUz"] ?? '',
    nameLt: json["nameLt"] ?? '',
    nameRu: json["nameRu"] ??'',
    nameEn: json["nameEn"] ??'',
    marketId: json["marketId"] ?? 0,
    statusId: json["statusId"] ??0,
    measureId: json["measureId"] ??0,
    parentId: json["parentId"] ?? 0,
    measureDto: json["measureDto"] == null ? null : MeasureDto.fromJson(json["measureDto"]),
    parentDto: json["parentDto"] == null ? null : MarketProductListResponse.fromJson(json["parentDto"]),
    children: List<MarketProductListResponse>.from(json["children"].map((x) => MarketProductListResponse.fromJson(x))),
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
    id: json["id"] ?? 0,
    nameUz: json["nameUz"] ??'',
    nameLt: json["nameLt"] ?? '',
    nameRu: json["nameRu"] ??'',
    nameEn: json["nameEn"] ??'',
    statusId: json["statusId"] ??0,
  );
}
