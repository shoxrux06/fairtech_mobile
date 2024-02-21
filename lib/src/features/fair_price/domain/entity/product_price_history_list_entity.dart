// To parse this JSON data, do
//
//     final productPriceHistoryListResponse = productPriceHistoryListResponseFromJson(jsonString);

import 'dart:convert';

ProductPriceHistoryListEntity productPriceHistoryListResponseFromJson(String str) => ProductPriceHistoryListEntity.fromJson(json.decode(str));

class ProductPriceHistoryListEntity {
  List<ProductPriceHistoryElement> list;
  int total;

  ProductPriceHistoryListEntity({
    required this.list,
    required this.total,
  });

  factory ProductPriceHistoryListEntity.fromJson(Map<String, dynamic> json) => ProductPriceHistoryListEntity(
    list: List<ProductPriceHistoryElement>.from(json["list"].map((x) => ProductPriceHistoryElement.fromJson(x))),
    total: json["total"],
  );

}

class ProductPriceHistoryElement {
  int id;
  num minPrice;
  num maxPrice;
  String date;
  num middleSum;
  int productId;
  String code;

  ProductPriceHistoryElement({
    required this.id,
    required this.minPrice,
    required this.maxPrice,
    required this.date,
    required this.middleSum,
    required this.productId,
    required this.code,
  });

  factory ProductPriceHistoryElement.fromJson(Map<String, dynamic> json) => ProductPriceHistoryElement(
    id: json["id"],
    minPrice: json["minPrice"],
    maxPrice: json["maxPrice"],
    date: json["date"],
    middleSum: json["middleSum"],
    productId: json["productId"],
    code: json["code"],
  );
}

