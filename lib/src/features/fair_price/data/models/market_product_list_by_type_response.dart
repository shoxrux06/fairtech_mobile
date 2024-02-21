// To parse this JSON data, do
//
//     final marketProductListByTypeResponse = marketProductListByTypeResponseFromJson(jsonString);

import 'dart:convert';

MarketProductListByTypeResponse marketProductListByTypeResponseFromJson(String str) => MarketProductListByTypeResponse.fromJson(json.decode(str));

String marketProductListByTypeResponseToJson(MarketProductListByTypeResponse data) => json.encode(data.toJson());

class MarketProductListByTypeResponse {
  int? id;
  String nameUz;
  String nameLt;
  String nameRu;
  String? nameEn;
  dynamic marketId;
  Code? code;
  dynamic codeOther;
  int? statusId;
  int? measureId;
  int? parentId;
  Photo? photoPng;
  Photo? photoSvg;
  MeasureDto? measureDto;
  MarketProductListByTypeResponse? parentDto;
  List<MarketProductListByTypeResponse> children;
  List<dynamic> marketForSets;
  List<dynamic> priceUserIds;

  MarketProductListByTypeResponse({
    required this.id,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.marketId,
    required this.code,
    required this.codeOther,
    required this.statusId,
    required this.measureId,
    required this.parentId,
    required this.photoPng,
    required this.photoSvg,
    required this.measureDto,
    required this.parentDto,
    required this.children,
    required this.marketForSets,
    required this.priceUserIds,
  });

  factory MarketProductListByTypeResponse.fromJson(Map<String, dynamic> json) => MarketProductListByTypeResponse(
    id: json["id"],
    nameUz: json["nameUz"],
    nameLt: json["nameLt"],
    nameRu: json["nameRu"],
    nameEn: json["nameEn"],
    marketId: json["marketId"],
    code: codeValues.map[json["code"]]!,
    codeOther: json["codeOther"],
    statusId: json["statusId"],
    measureId: json["measureId"],
    parentId: json["parentId"],
    photoPng: json["photoPng"] == null ? null : Photo.fromJson(json["photoPng"]),
    photoSvg: json["photoSvg"] == null ? null : Photo.fromJson(json["photoSvg"]),
    measureDto: json["measureDto"] == null ? null : MeasureDto.fromJson(json["measureDto"]),
    parentDto: json["parentDto"] == null ? null : MarketProductListByTypeResponse.fromJson(json["parentDto"]),
    children: List<MarketProductListByTypeResponse>.from(json["children"].map((x) => MarketProductListByTypeResponse.fromJson(x))),
    marketForSets: List<dynamic>.from(json["marketForSets"].map((x) => x)),
    priceUserIds: List<dynamic>.from(json["priceUserIds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUz": nameUz,
    "nameLt": nameLt,
    "nameRu": nameRu,
    "nameEn": nameEn,
    "marketId": marketId,
    "code": codeValues.reverse[code],
    "codeOther": codeOther,
    "statusId": statusId,
    "measureId": measureId,
    "parentId": parentId,
    "photoPng": photoPng?.toJson(),
    "photoSvg": photoSvg?.toJson(),
    "measureDto": measureDto?.toJson(),
    "parentDto": parentDto?.toJson(),
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
    "marketForSets": List<dynamic>.from(marketForSets.map((x) => x)),
    "priceUserIds": List<dynamic>.from(priceUserIds.map((x) => x)),
  };
}

enum Code {
  FOODS
}

final codeValues = EnumValues({
  "FOODS": Code.FOODS
});

class MeasureDto {
  int id;
  Name nameUz;
  NameLt nameLt;
  Name nameRu;
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
    nameUz: nameValues.map[json["nameUz"]]!,
    nameLt: nameLtValues.map[json["nameLt"]]!,
    nameRu: nameValues.map[json["nameRu"]]!,
    nameEn: json["nameEn"],
    statusId: json["statusId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameUz": nameValues.reverse[nameUz],
    "nameLt": nameLtValues.reverse[nameLt],
    "nameRu": nameValues.reverse[nameRu],
    "nameEn": nameEn,
    "statusId": statusId,
  };
}

enum NameLt {
  DONA,
  KG,
  LITR,
  THE_10_DONA
}

final nameLtValues = EnumValues({
  "dona": NameLt.DONA,
  "kg": NameLt.KG,
  "litr": NameLt.LITR,
  "10 dona": NameLt.THE_10_DONA
});

enum Name {
  EMPTY,
  NAME,
  NAME_10,
  PURPLE,
  THE_10
}

final nameValues = EnumValues({
  "литр": Name.EMPTY,
  "дона": Name.NAME,
  "10 дона": Name.NAME_10,
  "кг": Name.PURPLE,
  "10 шт": Name.THE_10
});

class Photo {
  int id;
  int size;
  String name;
  dynamic modifiedFileName;
  FileExtension fileExtension;
  String uploadPath;
  dynamic absolutePath;
  dynamic originalName;
  dynamic mimeType;

  Photo({
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

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"],
    size: json["size"],
    name: json["name"],
    modifiedFileName: json["modifiedFileName"],
    fileExtension: fileExtensionValues.map[json["fileExtension"]]!,
    uploadPath: json["uploadPath"],
    absolutePath: json["absolutePath"],
    originalName: json["originalName"],
    mimeType: json["mimeType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "size": size,
    "name": name,
    "modifiedFileName": modifiedFileName,
    "fileExtension": fileExtensionValues.reverse[fileExtension],
    "uploadPath": uploadPath,
    "absolutePath": absolutePath,
    "originalName": originalName,
    "mimeType": mimeType,
  };
}

enum FileExtension {
  PNG,
  SVG
}

final fileExtensionValues = EnumValues({
  "png": FileExtension.PNG,
  "svg": FileExtension.SVG
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
