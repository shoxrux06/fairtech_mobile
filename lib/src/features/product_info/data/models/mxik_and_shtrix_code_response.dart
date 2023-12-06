// To parse this JSON data, do
//
//     final mxikAndShtrixCodeResponse = mxikAndShtrixCodeResponseFromJson(jsonString);

import 'dart:convert';

MxikAndShtrixCodeResponse mxikAndShtrixCodeResponseFromJson(String str) => MxikAndShtrixCodeResponse.fromJson(json.decode(str));


class MxikAndShtrixCodeResponse {
  bool success;
  String reason;
  dynamic records;
  Data data;

  MxikAndShtrixCodeResponse({
    required this.success,
    required this.reason,
    required this.records,
    required this.data,
  });

  factory MxikAndShtrixCodeResponse.fromJson(Map<String, dynamic> json) => MxikAndShtrixCodeResponse(
    success: json["success"] ?? false,
    reason: json["reason"] ??'',
    records: json["records"],
    data: Data.fromJson(json["data"]),
  );
}

class Data {
  String mxikCode;
  MxikInfo mxikInfo;
  MarkingInfo markingInfo;
  dynamic cardInfo;

  Data({
    required this.mxikCode,
    required this.mxikInfo,
    required this.markingInfo,
    required this.cardInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mxikCode: json["mxik_code"] ??'',
    mxikInfo:json["mxik_info"] != null? MxikInfo.fromJson(json["mxik_info"]): MxikInfo.fromJson({}),
    markingInfo:json["marking_info"] != null? MarkingInfo.fromJson(json["marking_info"]):MarkingInfo.fromJson({}),
    cardInfo: json["card_info"],
  );
}

class MarkingInfo {
  int id;
  String productName;
  String gtin;
  List<CatalogDatum> catalogData;

  MarkingInfo({
    required this.id,
    required this.productName,
    required this.gtin,
    required this.catalogData,
  });

  factory MarkingInfo.fromJson(Map<String, dynamic> json) => MarkingInfo(
    id: json["id"] ?? 0,
    productName: json["product_name"] ?? '',
    gtin: json["gtin"] ??'',
    catalogData: json["catalog_data"] != null?List<CatalogDatum>.from(json["catalog_data"].map((x) => CatalogDatum.fromJson(x))):[],
  );
}

class CatalogDatum {
  String productImageUrl;
  dynamic brandName;
  List<Category> categories;
  List<GoodAttr> goodAttrs;
  List<String> photoUrl;

  CatalogDatum({
    required this.productImageUrl,
    required this.brandName,
    required this.categories,
    required this.goodAttrs,
    required this.photoUrl,
  });

  factory CatalogDatum.fromJson(Map<String, dynamic> json) => CatalogDatum(
    productImageUrl: json["product_image_url"] ??'',
    brandName: json["brand_name"],
    categories:json["categories"] != null? List<Category>.from(json["categories"].map((x) => Category.fromJson(x))):[],
    goodAttrs: json["good_attrs"] != null? List<GoodAttr>.from(json["good_attrs"].map((x) => GoodAttr.fromJson(x))):[],
    photoUrl: json["photo_url"] != null?List<String>.from(json["photo_url"].map((x) => x)):[],
  );
}

class Category {
  String catName;
  String classifier;

  Category({
    required this.catName,
    required this.classifier,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    catName: json["cat_name"] ??'',
    classifier: json["classifier"] ??'',
  );
}

class GoodAttr {
  String attrName;
  String? attrValue;
  String? attrValueType;
  String attrGroupName;

  GoodAttr({
    required this.attrName,
    required this.attrValue,
    required this.attrValueType,
    required this.attrGroupName,
  });

  factory GoodAttr.fromJson(Map<String, dynamic> json) => GoodAttr(
    attrName: json["attr_name"] ??'',
    attrValue: json["attr_value"] ??'',
    attrValueType: json["attr_value_type"] ??'',
    attrGroupName: json["attr_group_name"] ??'',
  );
}

class MxikInfo {
  String internationalCode;
  String groupName;
  String className;
  String positionName;
  String subPositionName;
  String brandName;
  String mxikName;
  String attributeName;
  List<Package> packages;

  MxikInfo({
    required this.internationalCode,
    required this.groupName,
    required this.className,
    required this.positionName,
    required this.subPositionName,
    required this.brandName,
    required this.mxikName,
    required this.attributeName,
    required this.packages,
  });

  factory MxikInfo.fromJson(Map<String, dynamic> json) => MxikInfo(
    internationalCode: json["international_code"] ??'',
    groupName: json["group_name"] ??'',
    className: json["class_name"] ?? '',
    positionName: json["position_name"] ??'',
    subPositionName: json["sub_position_name"] ??"",
    brandName: json["brand_name"] ??'',
    mxikName: json["mxik_name"] ??'',
    attributeName: json["attribute_name"] ??'',
    packages:json["packages"]!= null? List<Package>.from(json["packages"].map((x) => Package.fromJson(x))):[],
  );
}

class Package {
  int packageCode;
  String mxikCode;
  String packageName;

  Package({
    required this.packageCode,
    required this.mxikCode,
    required this.packageName,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    packageCode: json["package_code"] ??0,
    mxikCode: json["mxik_code"] ??'',
    packageName: json["package_name"] ??'',
  );
}
