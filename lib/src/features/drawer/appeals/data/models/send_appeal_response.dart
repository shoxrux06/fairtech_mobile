// To parse this JSON data, do
//
//     final sendAppealResponse = sendAppealResponseFromJson(jsonString);

import 'dart:convert';

SendAppealResponse sendAppealResponseFromJson(String str) => SendAppealResponse.fromJson(json.decode(str));

String sendAppealResponseToJson(SendAppealResponse data) => json.encode(data.toJson());

class SendAppealResponse {
  int status;
  String message;
  int data;

  SendAppealResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SendAppealResponse.fromJson(Map<String, dynamic> json) => SendAppealResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
