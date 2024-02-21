// To parse this JSON data, do
//
//     final marketListResponse = marketListResponseFromJson(jsonString);

import 'dart:convert';

List<MarketListResponse> marketListResponseFromJson(String str) => List<MarketListResponse>.from(json.decode(str).map((x) => MarketListResponse.fromJson(x)));

class MarketListResponse {
  int id;
  String address;
  String disNameLt;
  String disNameUz;
  String disNameRu;
  int soato;
  String marketName;
  String tin;
  int statusId;
  int marketTypeId;
  int businessStructureId;
  String businessStructureUz;
  String businessStructureRu;
  String businessStructureLt;
  PriceMarketTypeDto priceMarketTypeDto;

  MarketListResponse({
    required this.id,
    required this.address,
    required this.disNameLt,
    required this.disNameUz,
    required this.disNameRu,
    required this.soato,
    required this.marketName,
    required this.tin,
    required this.statusId,
    required this.marketTypeId,
    required this.businessStructureId,
    required this.businessStructureUz,
    required this.businessStructureRu,
    required this.businessStructureLt,
    required this.priceMarketTypeDto,
  });

  factory MarketListResponse.fromJson(Map<String, dynamic> json) => MarketListResponse(
    id: json["id"] ??0,
    address: json["address"] ??'',
    disNameLt: json["disNameLt"] ??'',
    disNameUz: json["disNameUz"] ??'',
    disNameRu: json["disNameRu"] ??'',
    soato: json["soato"] ??0,
    marketName: json["marketName"] ??'',
    tin: json["tin"] ??'',
    statusId: json["statusId"] ??0,
    marketTypeId: json["marketTypeId"] ??0,
    businessStructureId: json["businessStructureId"] ??0,
    businessStructureUz: json["businessStructureUz"] ??'',
    businessStructureRu: json["businessStructureRu"] ??'',
    businessStructureLt: json["businessStructureLt"] ??'',
    priceMarketTypeDto: PriceMarketTypeDto.fromJson(json["priceMarketTypeDto"]),
  );

}

class PriceMarketTypeDto {
  int id;
  String nameUz;
  String nameLt;
  String nameRu;
  String type;
  int statusId;

  PriceMarketTypeDto({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.type,
    required this.statusId,
  });

  factory PriceMarketTypeDto.fromJson(Map<String, dynamic> json) => PriceMarketTypeDto(
    id: json["id"] ??0,
    nameUz: json["nameUz"] ??'',
    nameLt: json["nameLt"] ??'',
    nameRu: json["nameRu"] ??'',
    type: json["type"] ?? '',
    statusId: json["statusId"] ??0,
  );
}
