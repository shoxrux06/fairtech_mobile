// To parse this JSON data, do
//
//     final marketListResponse = marketListResponseFromJson(jsonString);

import 'dart:convert';

MarketListResponse marketListResponseFromJson(String str) => MarketListResponse.fromJson(json.decode(str));

class MarketListResponse {
  List<ListElement> list;
  int total;

  MarketListResponse({
    required this.list,
    required this.total,
  });

  factory MarketListResponse.fromJson(Map<String, dynamic> json) => MarketListResponse(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    total: json["total"] ??0,
  );

}

class ListElement {
  int id;
  String address;
  String disNameLt;
  String disNameUz;
  String disNameRu;
  int soato;
  String marketName;
  String tin;
  dynamic type;
  int statusId;
  int marketTypeId;
  int businessStructureId;
  String businessStructureUz;
  String businessStructureRu;
  String businessStructureLt;
  PriceMarketTypeDto priceMarketTypeDto;

  ListElement({
    required this.id,
    required this.address,
    required this.disNameLt,
    required this.disNameUz,
    required this.disNameRu,
    required this.soato,
    required this.marketName,
    required this.tin,
    required this.type,
    required this.statusId,
    required this.marketTypeId,
    required this.businessStructureId,
    required this.businessStructureUz,
    required this.businessStructureRu,
    required this.businessStructureLt,
    required this.priceMarketTypeDto,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ??0,
    address: json["address"] ??'',
    disNameLt: json["disNameLt"] ??'',
    disNameUz: json["disNameUz"] ??'',
    disNameRu: json["disNameRu"] ??'',
    soato: json["soato"] ??0,
    marketName: json["marketName"] ??'',
    tin: json["tin"] ??'',
    type: json["type"],
    statusId: json["statusId"] ?? 0,
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
  dynamic nameEn;
  String type;
  int statusId;

  PriceMarketTypeDto({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.type,
    required this.statusId,
  });

  factory PriceMarketTypeDto.fromJson(Map<String, dynamic> json) => PriceMarketTypeDto(
    id: json["id"] ??0,
    nameUz: json["nameUz"] ??'',
    nameLt: json["nameLt"] ??'',
    nameRu: json["nameRu"] ??'',
    nameEn: json["nameEn"] ??'',
    type: json["type"] ??'',
    statusId: json["statusId"] ??0,
  );
}
