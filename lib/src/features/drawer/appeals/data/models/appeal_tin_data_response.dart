// To parse this JSON data, do
//
//     final appealTinDataResponse = appealTinDataResponseFromJson(jsonString);

import 'dart:convert';

AppealTinDataResponse appealTinDataResponseFromJson(String str) => AppealTinDataResponse.fromJson(json.decode(str));


class AppealTinDataResponse {
  String companyShortName;
  String streetName;

  AppealTinDataResponse({
    required this.companyShortName,
    required this.streetName,
  });

  factory AppealTinDataResponse.fromJson(Map<String, dynamic> json) => AppealTinDataResponse(
    companyShortName: json["company"]??'---',
    streetName: json["companyBillingAddress"]??'---'
  );
}



