// To parse this JSON data, do
//
//     final pharmInfoResponse = pharmInfoResponseFromJson(jsonString);

import 'dart:convert';

PharmInfoResponse pharmInfoResponseFromJson(String str) => PharmInfoResponse.fromJson(json.decode(str));

String pharmInfoResponseToJson(PharmInfoResponse data) => json.encode(data.toJson());

class PharmInfoResponse {
  List<ListElement> list;
  int total;

  PharmInfoResponse({
    required this.list,
    required this.total,
  });

  factory PharmInfoResponse.fromJson(Map<String, dynamic> json) => PharmInfoResponse(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "total": total,
  };
}

class ListElement {
  String createJson;
  String updateJson;
  dynamic attachedEmployeeDate;
  Status status;
  int id;
  int consumerId;
  String? consumerLastName;
  String consumerFirstName;
  String? consumerMiddleName;
  int? consumerPinfl;
  String consumerPhone;
  dynamic consumerAddress;
  dynamic consumerPhoto;
  dynamic allExtraPrice;
  List<Medication> medications;
  dynamic pharmDocuments;
  int pharmacyId;
  String pharmacyName;
  int pharmacyTin;
  dynamic pharmacyEmail;
  dynamic pharmacyAddress;
  PharmacyRegionName pharmacyRegionName;
  PharmacyDistrictName pharmacyDistrictName;
  int pharmacyNs10Code;
  int pharmacyNs11Code;
  dynamic innerEmployeeId;
  dynamic innerEmployeeName;
  int belongDepartmentId;
  BelongDepartmentCode belongDepartmentCode;
  BelongDepartmentName belongDepartmentName;
  dynamic medicationFounderName;
  dynamic medicationFounderFirstName;
  dynamic medicationFounderMiddleName;
  dynamic medicationFounderLastName;
  dynamic medicationFounderPassport;
  dynamic medicationFounderPhone;
  dynamic pharmFileDto;
  dynamic pharmCourtDto;
  dynamic qrLink;
  FinishedStatus finishedStatus;
  FinishedDate finishedDate;
  int amountFinish;
  dynamic sendSms;
  dynamic wasAnswer;
  dynamic consumerSendSmsDate;
  dynamic consumerSendSmsMessage;
  dynamic checkPrice;
  dynamic checkResultComment;
  List<dynamic> fileDtos;
  String mnumber;

  ListElement({
    required this.createJson,
    required this.updateJson,
    required this.attachedEmployeeDate,
    required this.status,
    required this.id,
    required this.consumerId,
    required this.consumerLastName,
    required this.consumerFirstName,
    required this.consumerMiddleName,
    required this.consumerPinfl,
    required this.consumerPhone,
    required this.consumerAddress,
    required this.consumerPhoto,
    required this.allExtraPrice,
    required this.medications,
    required this.pharmDocuments,
    required this.pharmacyId,
    required this.pharmacyName,
    required this.pharmacyTin,
    required this.pharmacyEmail,
    required this.pharmacyAddress,
    required this.pharmacyRegionName,
    required this.pharmacyDistrictName,
    required this.pharmacyNs10Code,
    required this.pharmacyNs11Code,
    required this.innerEmployeeId,
    required this.innerEmployeeName,
    required this.belongDepartmentId,
    required this.belongDepartmentCode,
    required this.belongDepartmentName,
    required this.medicationFounderName,
    required this.medicationFounderFirstName,
    required this.medicationFounderMiddleName,
    required this.medicationFounderLastName,
    required this.medicationFounderPassport,
    required this.medicationFounderPhone,
    required this.pharmFileDto,
    required this.pharmCourtDto,
    required this.qrLink,
    required this.finishedStatus,
    required this.finishedDate,
    required this.amountFinish,
    required this.sendSms,
    required this.wasAnswer,
    required this.consumerSendSmsDate,
    required this.consumerSendSmsMessage,
    required this.checkPrice,
    required this.checkResultComment,
    required this.fileDtos,
    required this.mnumber,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    createJson: json["createJson"],
    updateJson: json["updateJson"],
    attachedEmployeeDate: json["attachedEmployeeDate"],
    status: statusValues.map[json["status"]]!,
    id: json["id"],
    consumerId: json["consumerId"],
    consumerLastName: json["consumerLastName"],
    consumerFirstName: json["consumerFirstName"],
    consumerMiddleName: json["consumerMiddleName"],
    consumerPinfl: json["consumerPinfl"],
    consumerPhone: json["consumerPhone"],
    consumerAddress: json["consumerAddress"],
    consumerPhoto: json["consumerPhoto"],
    allExtraPrice: json["allExtraPrice"],
    medications: List<Medication>.from(json["medications"].map((x) => Medication.fromJson(x))),
    pharmDocuments: json["pharmDocuments"],
    pharmacyId: json["pharmacyId"],
    pharmacyName: json["pharmacyName"],
    pharmacyTin: json["pharmacyTin"],
    pharmacyEmail: json["pharmacyEmail"],
    pharmacyAddress: json["pharmacyAddress"],
    pharmacyRegionName: pharmacyRegionNameValues.map[json["pharmacyRegionName"]]!,
    pharmacyDistrictName: pharmacyDistrictNameValues.map[json["pharmacyDistrictName"]]!,
    pharmacyNs10Code: json["pharmacyNs10Code"],
    pharmacyNs11Code: json["pharmacyNs11Code"],
    innerEmployeeId: json["innerEmployeeId"],
    innerEmployeeName: json["innerEmployeeName"],
    belongDepartmentId: json["belongDepartmentId"],
    belongDepartmentCode: belongDepartmentCodeValues.map[json["belongDepartmentCode"]]!,
    belongDepartmentName: belongDepartmentNameValues.map[json["belongDepartmentName"]]!,
    medicationFounderName: json["medicationFounderName"],
    medicationFounderFirstName: json["medicationFounderFirstName"],
    medicationFounderMiddleName: json["medicationFounderMiddleName"],
    medicationFounderLastName: json["medicationFounderLastName"],
    medicationFounderPassport: json["medicationFounderPassport"],
    medicationFounderPhone: json["medicationFounderPhone"],
    pharmFileDto: json["pharmFileDto"],
    pharmCourtDto: json["pharmCourtDto"],
    qrLink: json["qrLink"],
    finishedStatus: finishedStatusValues.map[json["finishedStatus"]]!,
    finishedDate: finishedDateValues.map[json["finishedDate"]]!,
    amountFinish: json["amountFinish"],
    sendSms: json["sendSms"],
    wasAnswer: json["wasAnswer"],
    consumerSendSmsDate: json["consumerSendSmsDate"],
    consumerSendSmsMessage: json["consumerSendSmsMessage"],
    checkPrice: json["checkPrice"],
    checkResultComment: json["checkResultComment"],
    fileDtos: List<dynamic>.from(json["fileDtos"].map((x) => x)),
    mnumber: json["mnumber"],
  );

  Map<String, dynamic> toJson() => {
    "createJson": createJson,
    "updateJson": updateJson,
    "attachedEmployeeDate": attachedEmployeeDate,
    "status": statusValues.reverse[status],
    "id": id,
    "consumerId": consumerId,
    "consumerLastName": consumerLastName,
    "consumerFirstName": consumerFirstName,
    "consumerMiddleName": consumerMiddleName,
    "consumerPinfl": consumerPinfl,
    "consumerPhone": consumerPhone,
    "consumerAddress": consumerAddress,
    "consumerPhoto": consumerPhoto,
    "allExtraPrice": allExtraPrice,
    "medications": List<dynamic>.from(medications.map((x) => x.toJson())),
    "pharmDocuments": pharmDocuments,
    "pharmacyId": pharmacyId,
    "pharmacyName": pharmacyName,
    "pharmacyTin": pharmacyTin,
    "pharmacyEmail": pharmacyEmail,
    "pharmacyAddress": pharmacyAddress,
    "pharmacyRegionName": pharmacyRegionNameValues.reverse[pharmacyRegionName],
    "pharmacyDistrictName": pharmacyDistrictNameValues.reverse[pharmacyDistrictName],
    "pharmacyNs10Code": pharmacyNs10Code,
    "pharmacyNs11Code": pharmacyNs11Code,
    "innerEmployeeId": innerEmployeeId,
    "innerEmployeeName": innerEmployeeName,
    "belongDepartmentId": belongDepartmentId,
    "belongDepartmentCode": belongDepartmentCodeValues.reverse[belongDepartmentCode],
    "belongDepartmentName": belongDepartmentNameValues.reverse[belongDepartmentName],
    "medicationFounderName": medicationFounderName,
    "medicationFounderFirstName": medicationFounderFirstName,
    "medicationFounderMiddleName": medicationFounderMiddleName,
    "medicationFounderLastName": medicationFounderLastName,
    "medicationFounderPassport": medicationFounderPassport,
    "medicationFounderPhone": medicationFounderPhone,
    "pharmFileDto": pharmFileDto,
    "pharmCourtDto": pharmCourtDto,
    "qrLink": qrLink,
    "finishedStatus": finishedStatusValues.reverse[finishedStatus],
    "finishedDate": finishedDateValues.reverse[finishedDate],
    "amountFinish": amountFinish,
    "sendSms": sendSms,
    "wasAnswer": wasAnswer,
    "consumerSendSmsDate": consumerSendSmsDate,
    "consumerSendSmsMessage": consumerSendSmsMessage,
    "checkPrice": checkPrice,
    "checkResultComment": checkResultComment,
    "fileDtos": List<dynamic>.from(fileDtos.map((x) => x)),
    "mnumber": mnumber,
  };
}

enum BelongDepartmentCode {
  T_14
}

final belongDepartmentCodeValues = EnumValues({
  "T-14": BelongDepartmentCode.T_14
});

enum BelongDepartmentName {
  TOSHKENT_SHAHAR_HUDUDIY_BOSHQARMASI
}

final belongDepartmentNameValues = EnumValues({
  "Toshkent shahar hududiy boshqarmasi": BelongDepartmentName.TOSHKENT_SHAHAR_HUDUDIY_BOSHQARMASI
});

enum FinishedDate {
  THE_231120230000
}

final finishedDateValues = EnumValues({
  "23-11-2023 00:00": FinishedDate.THE_231120230000
});

enum FinishedStatus {
  TIME_OPEN
}

final finishedStatusValues = EnumValues({
  "TIME_OPEN": FinishedStatus.TIME_OPEN
});

class Medication {
  int id;
  String name;
  String mxikCode;
  int paymentPrice;
  double referentPrice;
  double differencePrice;
  PaymentDate paymentDate;
  String checkNumber;

  Medication({
    required this.id,
    required this.name,
    required this.mxikCode,
    required this.paymentPrice,
    required this.referentPrice,
    required this.differencePrice,
    required this.paymentDate,
    required this.checkNumber,
  });

  factory Medication.fromJson(Map<String, dynamic> json) => Medication(
    id: json["id"],
    name: json["name"],
    mxikCode: json["mxikCode"],
    paymentPrice: json["paymentPrice"],
    referentPrice: json["referentPrice"]?.toDouble(),
    differencePrice: json["differencePrice"]?.toDouble(),
    paymentDate: paymentDateValues.map[json["paymentDate"]]!,
    checkNumber: json["checkNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mxikCode": mxikCode,
    "paymentPrice": paymentPrice,
    "referentPrice": referentPrice,
    "differencePrice": differencePrice,
    "paymentDate": paymentDateValues.reverse[paymentDate],
    "checkNumber": checkNumber,
  };
}

enum PaymentDate {
  THE_071120230500,
  THE_081120230500
}

final paymentDateValues = EnumValues({
  "07-11-2023 05:00": PaymentDate.THE_071120230500,
  "08-11-2023 05:00": PaymentDate.THE_081120230500
});

enum PharmacyDistrictName {
  EMPTY,
  PHARMACY_DISTRICT_NAME,
  PURPLE
}

final pharmacyDistrictNameValues = EnumValues({
  "УЧТЕПА ТУМАНИ": PharmacyDistrictName.EMPTY,
  "ЧИЛОНЗОР ТУМАНИ": PharmacyDistrictName.PHARMACY_DISTRICT_NAME,
  "ЮНУСОБОД ТУМАНИ": PharmacyDistrictName.PURPLE
});

enum PharmacyRegionName {
  EMPTY
}

final pharmacyRegionNameValues = EnumValues({
  "ТОШКЕНТ ШАҲАР": PharmacyRegionName.EMPTY
});

enum Status {
  SEND_TO_REGION
}

final statusValues = EnumValues({
  "SEND_TO_REGION": Status.SEND_TO_REGION
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
