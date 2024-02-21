// To parse this JSON data, do
//
//     final productPriceListResponse = productPriceListResponseFromJson(jsonString);

import 'dart:convert';

ProductPriceListResponse productPriceListResponseFromJson(String str) => ProductPriceListResponse.fromJson(json.decode(str));

class ProductPriceListResponse {
  List<ListElement> list;
  int total;

  ProductPriceListResponse({
    required this.list,
    required this.total,
  });

  factory ProductPriceListResponse.fromJson(Map<String, dynamic> json) => ProductPriceListResponse(
    list: json["list"] != null? List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))):[],
    total: json["total"] ??0,
  );
}

class ListElement {
  int id;
  double minPrice;
  double maxPrice;
  Date date;
  int statusId;
  int productId;
  Code code;
  PriceProductDto priceProductDto;
  int marketId;
  MarketDto marketDto;

  ListElement({
    required this.id,
    required this.minPrice,
    required this.maxPrice,
    required this.date,
    required this.statusId,
    required this.productId,
    required this.code,
    required this.priceProductDto,
    required this.marketId,
    required this.marketDto,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ??0,
    minPrice: json["minPrice"]?.toDouble() ??0.0,
    maxPrice: json["maxPrice"]?.toDouble()??0.0,
    date: dateValues.map[json["date"]]!,
    statusId: json["statusId"] ??0,
    productId: json["productId"] ?? 0,
    code: codeValues.map[json["code"]]!,
    priceProductDto: PriceProductDto.fromJson(json["priceProductDto"]),
    marketId: json["marketId"] ?? 0,
    marketDto: MarketDto.fromJson(json["marketDto"]),
  );
}

enum Code {
  APP
}

final codeValues = EnumValues({
  "app": Code.APP
});

enum Date {
  THE_25012024,
  THE_29012024
}

final dateValues = EnumValues({
  "25-01-2024": Date.THE_25012024,
  "29-01-2024": Date.THE_29012024
});

class MarketDto {
  int id;
  Address address;
  Address disNameLt;
  DisNameUz disNameUz;
  DisNameRu disNameRu;
  int soato;
  String marketName;
  String tin;
  dynamic type;
  int statusId;
  int marketTypeId;
  int businessStructureId;
  BusinessStructureUz businessStructureUz;
  BusinessStructureRu businessStructureRu;
  BusinessStructureLt businessStructureLt;
  EDto priceMarketTypeDto;

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
  });

  factory MarketDto.fromJson(Map<String, dynamic> json) => MarketDto(
    id: json["id"],
    address: addressValues.map[json["address"]]!,
    disNameLt: addressValues.map[json["disNameLt"]]!,
    disNameUz: disNameUzValues.map[json["disNameUz"]]!,
    disNameRu: disNameRuValues.map[json["disNameRu"]]!,
    soato: json["soato"],
    marketName: json["marketName"],
    tin: json["tin"],
    type: json["type"],
    statusId: json["statusId"],
    marketTypeId: json["marketTypeId"],
    businessStructureId: json["businessStructureId"],
    businessStructureUz: businessStructureUzValues.map[json["businessStructureUz"]]!,
    businessStructureRu: businessStructureRuValues.map[json["businessStructureRu"]]!,
    businessStructureLt: businessStructureLtValues.map[json["businessStructureLt"]]!,
    priceMarketTypeDto: EDto.fromJson(json["priceMarketTypeDto"]),
  );
}

enum Address {
  BUXORO_SHAHAR,
  BUXORO_TUMANI,
  MARG_ILON_SHAHAR,
  QIZILTEPA_TUMANI,
  QUMQO_RG_ON_TUMANI,
  TERMIZ_SHAHAR,
  TO_RAQO_RG_ON_TUMANI
}

final addressValues = EnumValues({
  "Buxoro shahar": Address.BUXORO_SHAHAR,
  "Buxoro tumani": Address.BUXORO_TUMANI,
  "Marg‘ilon shahar": Address.MARG_ILON_SHAHAR,
  "Qiziltepa tumani": Address.QIZILTEPA_TUMANI,
  "Qumqo'rg'on tumani": Address.QUMQO_RG_ON_TUMANI,
  "Termiz shahar": Address.TERMIZ_SHAHAR,
  "To'raqo'rg'on tumani": Address.TO_RAQO_RG_ON_TUMANI
});

enum BusinessStructureLt {
  AKSIYADORLIK_JAMIYATI,
  MAS_ULIYATI_CHEKLANGAN_JAMIYAT
}

final businessStructureLtValues = EnumValues({
  "Aksiyadorlik jamiyati": BusinessStructureLt.AKSIYADORLIK_JAMIYATI,
  "Masʼuliyati cheklangan jamiyat": BusinessStructureLt.MAS_ULIYATI_CHEKLANGAN_JAMIYAT
});

enum BusinessStructureRu {
  BUSINESS_STRUCTURE_RU,
  EMPTY
}

final businessStructureRuValues = EnumValues({
  "Акционерное общество": BusinessStructureRu.BUSINESS_STRUCTURE_RU,
  "Общество с ограниченной ответственностью": BusinessStructureRu.EMPTY
});

enum BusinessStructureUz {
  BUSINESS_STRUCTURE_UZ,
  EMPTY
}

final businessStructureUzValues = EnumValues({
  "Акциядорлик жамияти": BusinessStructureUz.BUSINESS_STRUCTURE_UZ,
  "Масъулияти чекланган жамият": BusinessStructureUz.EMPTY
});

enum DisNameRu {
  DIS_NAME_RU,
  EMPTY,
  FLUFFY,
  INDIGO,
  PURPLE,
  STICKY,
  TENTACLED
}

final disNameRuValues = EnumValues({
  "город Маргилан": DisNameRu.DIS_NAME_RU,
  "Бухарский район": DisNameRu.EMPTY,
  "город Термез": DisNameRu.FLUFFY,
  "Кумкурганский район": DisNameRu.INDIGO,
  "Кызылтепинский район": DisNameRu.PURPLE,
  "Туракурганский район": DisNameRu.STICKY,
  "город Бухара": DisNameRu.TENTACLED
});

enum DisNameUz {
  DIS_NAME_UZ,
  EMPTY,
  FLUFFY,
  INDIGO,
  PURPLE,
  STICKY,
  TENTACLED
}

final disNameUzValues = EnumValues({
  "Марғилон шаҳар": DisNameUz.DIS_NAME_UZ,
  "Бухоро тумани": DisNameUz.EMPTY,
  "Термиз шаҳар": DisNameUz.FLUFFY,
  "Қумқўрғон тумани": DisNameUz.INDIGO,
  "Қизилтепа тумани": DisNameUz.PURPLE,
  "Тўрақўрғон тумани": DisNameUz.STICKY,
  "Бухоро шаҳар": DisNameUz.TENTACLED
});

class EDto {
  int id;
  PriceMarketTypeDtoNameRu nameUz;
  NameLt nameLt;
  PriceMarketTypeDtoNameRu nameRu;
  dynamic nameEn;
  Type? type;
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
    nameUz: priceMarketTypeDtoNameRuValues.map[json["nameUz"]]!,
    nameLt: nameLtValues.map[json["nameLt"]]!,
    nameRu: priceMarketTypeDtoNameRuValues.map[json["nameRu"]]!,
    nameEn: json["nameEn"],
    type: typeValues.map[json["type"]]!,
    statusId: json["statusId"],
  );
}

enum NameLt {
  DEXKON_BOZORLARI,
  KG,
  KICHIK_DO_KONLAR,
  THE_1_LITR
}

final nameLtValues = EnumValues({
  "Dexkon bozorlari": NameLt.DEXKON_BOZORLARI,
  "Kg": NameLt.KG,
  "Kichik doʼkonlar ": NameLt.KICHIK_DO_KONLAR,
  "1 Litr": NameLt.THE_1_LITR
});

enum PriceMarketTypeDtoNameRu {
  EMPTY,
  KG,
  NAME,
  PURPLE,
  THE_1
}

final priceMarketTypeDtoNameRuValues = EnumValues({
  "Дехкон бозорлари": PriceMarketTypeDtoNameRu.EMPTY,
  "Kg": PriceMarketTypeDtoNameRu.KG,
  "Кичик дўконлар ": PriceMarketTypeDtoNameRu.NAME,
  "Кг": PriceMarketTypeDtoNameRu.PURPLE,
  "1 Литр": PriceMarketTypeDtoNameRu.THE_1
});

enum Type {
  DEXQON,
  KICHIK
}

final typeValues = EnumValues({
  "DEXQON": Type.DEXQON,
  "KICHIK": Type.KICHIK
});

class PriceProductDto {
  int id;
  String code;
  NameEnEnum nameUz;
  NameEnEnum nameLt;
  NameEnEnum nameRu;
  NameEnEnum nameEn;
  int statusId;
  int measureId;
  dynamic parentId;
  EDto measureDto;
  dynamic parentDto;
  List<dynamic> children;
  List<dynamic> marketForSets;
  List<dynamic> priceUserIds;

  PriceProductDto({
    required this.id,
    required this.code,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
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
    id: json["id"] ??0,
    code: json["code"] ??'',
    nameUz: nameEnEnumValues.map[json["nameUz"]]!,
    nameLt: nameEnEnumValues.map[json["nameLt"]]!,
    nameRu: nameEnEnumValues.map[json["nameRu"]]!,
    nameEn: nameEnEnumValues.map[json["nameEn"]]!,
    statusId: json["statusId"] ??0,
    measureId: json["measureId"] ??0,
    parentId: json["parentId"],
    measureDto: EDto.fromJson(json["measureDto"]),
    parentDto: json["parentDto"],
    children: List<dynamic>.from(json["children"].map((x) => x)),
    marketForSets: List<dynamic>.from(json["marketForSets"].map((x) => x)),
    priceUserIds: List<dynamic>.from(json["priceUserIds"].map((x) => x)),
  );
}

enum NameEnEnum {
  UN,
  YOG
}

final nameEnEnumValues = EnumValues({
  "Un": NameEnEnum.UN,
  "Yog'": NameEnEnum.YOG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
