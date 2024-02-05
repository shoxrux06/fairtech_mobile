// To parse this JSON data, do
//
//     final getAppealsByPhoneAndPinflResponse = getAppealsByPhoneAndPinflResponseFromJson(jsonString);

import 'dart:convert';

GetAppealsByPhoneAndPinflResponse getAppealsByPhoneAndPinflResponseFromJson(String str) => GetAppealsByPhoneAndPinflResponse.fromJson(json.decode(str));


class GetAppealsByPhoneAndPinflResponse {
  int count;
  String date;
  String lastName;
  String firstName;
  String middleName;

  GetAppealsByPhoneAndPinflResponse({
    required this.count,
    required this.date,
    required this.lastName,
    required this.firstName,
    required this.middleName,
  });

  factory GetAppealsByPhoneAndPinflResponse.fromJson(Map<String, dynamic> json) => GetAppealsByPhoneAndPinflResponse(
    count: json["count"] ?? 0,
    date: json["date"] ??'',
    lastName: json["lastName"] ??'',
    firstName: json["firstName"] ?? '',
    middleName: json["middleName"] ?? '',
  );
}
