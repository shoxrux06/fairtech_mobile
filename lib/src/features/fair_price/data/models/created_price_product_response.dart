// To parse this JSON data, do
//
//     final createdPriceProductResponse = createdPriceProductResponseFromJson(jsonString);

import 'dart:convert';

CreatedPriceProductResponse createdPriceProductResponseFromJson(String str) => CreatedPriceProductResponse.fromJson(json.decode(str));


class CreatedPriceProductResponse {
  int status;
  String message;
  Data data;

  CreatedPriceProductResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreatedPriceProductResponse.fromJson(Map<String, dynamic> json) => CreatedPriceProductResponse(
    status: json["status"] ?? 0,
    message: json["message"] ??'',
    data: json["data"] != null? Data.fromJson(json["data"]): Data.fromJson({}),
  );
}

class Data {
  String createdBy;
  String lastModifiedBy;
  int id;
  double maxPrice;
  double minPrice;
  int date;
  String code;

  Data({
    required this.createdBy,
    required this.lastModifiedBy,
    required this.id,
    required this.maxPrice,
    required this.minPrice,
    required this.date,
    required this.code,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdBy: json["createdBy"] ??'',
    lastModifiedBy: json["lastModifiedBy"] ??'',
    id: json["id"] ?? 0,
    maxPrice: json["maxPrice"]?.toDouble() ??0.0,
    minPrice: json["minPrice"]?.toDouble() ?? 0.0,
    date: json["date"] ?? 0,
    code: json["code"] ??'',
  );

}
