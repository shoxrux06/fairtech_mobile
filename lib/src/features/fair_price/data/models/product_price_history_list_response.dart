// To parse this JSON data, do
//
//     final productPriceHistoryListResponse = productPriceHistoryListResponseFromJson(jsonString);

import 'dart:convert';

ProductPriceHistoryListResponse productPriceHistoryListResponseFromJson(String str) => ProductPriceHistoryListResponse.fromJson(json.decode(str));

class ProductPriceHistoryListResponse {
  List<ListElement> list;
  int total;

  ProductPriceHistoryListResponse({
    required this.list,
    required this.total,
  });

  factory ProductPriceHistoryListResponse.fromJson(Map<String, dynamic> json) => ProductPriceHistoryListResponse(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    total: json["total"],
  );

}

class ListElement {
  int id;
  int minPrice;
  int maxPrice;
  String date;
  int middleSum;
  int statusId;
  int productId;
  String code;
  PriceProductDto priceProductDto;
  int marketId;
  MarketDto marketDto;

  ListElement({
    required this.id,
    required this.minPrice,
    required this.maxPrice,
    required this.date,
    required this.middleSum,
    required this.statusId,
    required this.productId,
    required this.code,
    required this.priceProductDto,
    required this.marketId,
    required this.marketDto,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    minPrice: json["minPrice"],
    maxPrice: json["maxPrice"],
    date: json["date"],
    middleSum: json["middleSum"],
    statusId: json["statusId"],
    productId: json["productId"],
    code: json["code"],
    priceProductDto: PriceProductDto.fromJson(json["priceProductDto"]),
    marketId: json["marketId"],
    marketDto: MarketDto.fromJson(json["marketDto"]),
  );

}

class MarketDto {
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
  EDto priceMarketTypeDto;
  PriceUserDto priceUserDto;

  MarketDto({
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
    required this.priceUserDto,
  });

  factory MarketDto.fromJson(Map<String, dynamic> json) => MarketDto(
    id: json["id"],
    address: json["address"],
    disNameLt: json["disNameLt"],
    disNameUz: json["disNameUz"],
    disNameRu: json["disNameRu"],
    soato: json["soato"],
    marketName: json["marketName"],
    tin: json["tin"],
    type: json["type"],
    statusId: json["statusId"],
    marketTypeId: json["marketTypeId"],
    businessStructureId: json["businessStructureId"],
    businessStructureUz: json["businessStructureUz"],
    businessStructureRu: json["businessStructureRu"],
    businessStructureLt: json["businessStructureLt"],
    priceMarketTypeDto: EDto.fromJson(json["priceMarketTypeDto"]),
    priceUserDto: PriceUserDto.fromJson(json["priceUserDto"]),
  );

}

class EDto {
  int id;
  String nameUz;
  String nameLt;
  String nameRu;
  dynamic nameEn;
  String? type;
  int statusId;

  EDto({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    this.type,
    required this.statusId,
  });

  factory EDto.fromJson(Map<String, dynamic> json) => EDto(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    type: json["type"],
    statusId: json["statusId"],
  );

}

class PriceUserDto {
  int id;
  String nameUz;
  dynamic nameLt;
  dynamic nameRu;
  dynamic nameEn;
  String pinfl;
  String phone;
  String passportNumber;
  String passportSeries;
  int statusId;
  dynamic marketId;

  PriceUserDto({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.pinfl,
    required this.phone,
    required this.passportNumber,
    required this.passportSeries,
    required this.statusId,
    required this.marketId,
  });

  factory PriceUserDto.fromJson(Map<String, dynamic> json) => PriceUserDto(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    pinfl: json["pinfl"],
    phone: json["phone"],
    passportNumber: json["passportNumber"],
    passportSeries: json["passportSeries"],
    statusId: json["statusId"],
    marketId: json["marketId"],
  );

}

class PriceProductDto {
  int id;
  String nameUz;
  String nameLt;
  String nameRu;
  dynamic nameEn;
  dynamic marketId;
  String code;
  int statusId;
  int measureId;
  dynamic parentId;
  EDto measureDto;
  dynamic parentDto;
  List<dynamic> children;
  List<dynamic> marketForSets;
  List<int> priceUserIds;

  PriceProductDto({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.marketId,
    required this.code,
    required this.statusId,
    required this.measureId,
    required this.parentId,
    required this.measureDto,
    required this.parentDto,
    required this.children,
    required this.marketForSets,
    required this.priceUserIds,
  });

  factory PriceProductDto.fromJson(Map<String, dynamic> json) => PriceProductDto(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    marketId: json["marketId"],
    code: json["code"],
    statusId: json["statusId"],
    measureId: json["measureId"],
    parentId: json["parentId"],
    measureDto: EDto.fromJson(json["measureDto"]),
    parentDto: json["parentDto"],
    children: List<dynamic>.from(json["children"].map((x) => x)),
    marketForSets: List<dynamic>.from(json["marketForSets"].map((x) => x)),
    priceUserIds: List<int>.from(json["priceUserIds"].map((x) => x)),
  );

}
