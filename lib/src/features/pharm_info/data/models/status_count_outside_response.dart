// To parse this JSON data, do
//
//     final statusCountOutsideResponse = statusCountOutsideResponseFromJson(jsonString);

import 'dart:convert';

StatusCountOutsideResponse statusCountOutsideResponseFromJson(String str) => StatusCountOutsideResponse.fromJson(json.decode(str));

String statusCountOutsideResponseToJson(StatusCountOutsideResponse data) => json.encode(data.toJson());

class StatusCountOutsideResponse {
  dynamic created;
  dynamic sendToRegion;
  dynamic beingSeen;
  int process;
  dynamic sendToCourt;
  dynamic check;
  dynamic checkIsError;
  dynamic timeExtended;
  int finished;

  StatusCountOutsideResponse({
    required this.created,
    required this.sendToRegion,
    required this.beingSeen,
    required this.process,
    required this.sendToCourt,
    required this.check,
    required this.checkIsError,
    required this.timeExtended,
    required this.finished,
  });

  factory StatusCountOutsideResponse.fromJson(Map<String, dynamic> json) => StatusCountOutsideResponse(
    created: json["created"],
    sendToRegion: json["sendToRegion"],
    beingSeen: json["beingSeen"],
    process: json["process"],
    sendToCourt: json["sendToCourt"],
    check: json["check"],
    checkIsError: json["checkIsError"],
    timeExtended: json["timeExtended"],
    finished: json["finished"],
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
  };
}
