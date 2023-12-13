// To parse this JSON data, do
//
//     final productAppealCountResponse = productAppealCountResponseFromJson(jsonString);

import 'dart:convert';

ProductAppealCountResponse productAppealCountResponseFromJson(String str) => ProductAppealCountResponse.fromJson(json.decode(str));

String productAppealCountResponseToJson(ProductAppealCountResponse data) => json.encode(data.toJson());

class ProductAppealCountResponse {
  int created;
  dynamic sendToRegion;
  dynamic beingSeen;
  int process;
  dynamic sendToCourt;
  dynamic check;
  dynamic checkIsError;
  dynamic timeExtended;
  int finished;
  dynamic suspended;

  ProductAppealCountResponse({
    required this.created,
    required this.sendToRegion,
    required this.beingSeen,
    required this.process,
    required this.sendToCourt,
    required this.check,
    required this.checkIsError,
    required this.timeExtended,
    required this.finished,
    required this.suspended,
  });

  factory ProductAppealCountResponse.fromJson(Map<String, dynamic> json) => ProductAppealCountResponse(
    created: json["created"] ??0,
    sendToRegion: json["sendToRegion"],
    beingSeen: json["beingSeen"],
    process: json["process"] ??0,
    sendToCourt: json["sendToCourt"],
    check: json["check"],
    checkIsError: json["checkIsError"],
    timeExtended: json["timeExtended"],
    finished: json["finished"] ??0,
    suspended: json["suspended"],
  );

  Map<String, dynamic> toJson() => {
    "created": created,
    "sendToRegion": sendToRegion,
    "beingSeen": beingSeen,
    "process": process,
    "sendToCourt": sendToCourt,
    "check": check,
    "checkIsError": checkIsError,
    "timeExtended": timeExtended,
    "finished": finished,
    "suspended": suspended,
  };
}
