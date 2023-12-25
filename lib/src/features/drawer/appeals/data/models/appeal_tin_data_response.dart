// To parse this JSON data, do
//
//     final appealTinDataResponse = appealTinDataResponseFromJson(jsonString);

import 'dart:convert';

AppealTinDataResponse appealTinDataResponseFromJson(String str) => AppealTinDataResponse.fromJson(json.decode(str));


class AppealTinDataResponse {
  Company company;
  List<Address> companyShippingAddresses;

  AppealTinDataResponse({
    required this.company,
    required this.companyShippingAddresses,
  });

  factory AppealTinDataResponse.fromJson(Map<String, dynamic> json) => AppealTinDataResponse(
    company: json["company"] != null? Company.fromJson(json["company"]): Company.fromJson({}),
    companyShippingAddresses: json["companyShippingAddresses"] != null?List<Address>.from(json["companyShippingAddresses"].map((x) => Address.fromJson(x))):[],
  );
}


class Address {
  int countryCode;
  int sectorCode;
  String villageCode;
  String streetName;
  dynamic house;
  dynamic flat;
  int soato;
  String? cadastreNumber;
  String? postcode;

  Address({
    required this.countryCode,
    required this.sectorCode,
    required this.villageCode,
    required this.streetName,
    required this.house,
    required this.flat,
    required this.soato,
    required this.cadastreNumber,
    required this.postcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    countryCode: json["countryCode"] ??0,
    sectorCode: json["sectorCode"] ??0,
    villageCode: json["villageCode"] ??'',
    streetName: json["streetName"] ??'',
    house: json["house"],
    flat: json["flat"],
    soato: json["soato"] ??0,
    cadastreNumber: json["cadastreNumber"] ??'',
    postcode: json["postcode"] ??'',
  );

}

class Company {
  String name;
  String shortName;
  int opf;
  int kfs;
  String tin;
  String oked;
  String soogu;
  String sooguRegistrator;
  String registrationDate;
  String registrationNumber;
  String reregistrationDate;
  int status;
  dynamic statusUpdated;
  dynamic taxStatus;
  dynamic liquidationDate;
  dynamic liquidationReason;
  dynamic suspensionDate;
  dynamic suspensionReason;
  int taxMode;
  dynamic vatNumber;
  dynamic vatRegistrationDate;
  int taxpayerType;
  int businessType;
  int businessFund;
  int businessStructure;
  String businessFundCurrency;
  String createdSysDate;
  String updatedSysDate;
  dynamic taxModeBeginDate;
  dynamic taxModeEndDate;

  Company({
    required this.name,
    required this.shortName,
    required this.opf,
    required this.kfs,
    required this.tin,
    required this.oked,
    required this.soogu,
    required this.sooguRegistrator,
    required this.registrationDate,
    required this.registrationNumber,
    required this.reregistrationDate,
    required this.status,
    required this.statusUpdated,
    required this.taxStatus,
    required this.liquidationDate,
    required this.liquidationReason,
    required this.suspensionDate,
    required this.suspensionReason,
    required this.taxMode,
    required this.vatNumber,
    required this.vatRegistrationDate,
    required this.taxpayerType,
    required this.businessType,
    required this.businessFund,
    required this.businessStructure,
    required this.businessFundCurrency,
    required this.createdSysDate,
    required this.updatedSysDate,
    required this.taxModeBeginDate,
    required this.taxModeEndDate,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"] ??'',
    shortName: json["shortName"] ??'',
    opf: json["opf"] ?? 0,
    kfs: json["kfs"] ?? 0,
    tin: json["tin"] ??'',
    oked: json["oked"] ??'',
    soogu: json["soogu"] ??'',
    sooguRegistrator: json["sooguRegistrator"] ??'',
    registrationDate: json["registrationDate"] ??'',
    registrationNumber: json["registrationNumber"] ?? '',
    reregistrationDate: json["reregistrationDate"] ??'',
    status: json["status"] ??0,
    statusUpdated: json["statusUpdated"],
    taxStatus: json["taxStatus"],
    liquidationDate: json["liquidationDate"],
    liquidationReason: json["liquidationReason"],
    suspensionDate: json["suspensionDate"],
    suspensionReason: json["suspensionReason"],
    taxMode: json["taxMode"] ??0,
    vatNumber: json["vatNumber"],
    vatRegistrationDate: json["vatRegistrationDate"],
    taxpayerType: json["taxpayerType"] ??0,
    businessType: json["businessType"]??0,
    businessFund: json["businessFund"] ??0,
    businessStructure: json["businessStructure"] ??0,
    businessFundCurrency: json["businessFundCurrency"] ??'',
    createdSysDate: json["createdSysDate"] ??'',
    updatedSysDate: json["updatedSysDate"] ??'',
    taxModeBeginDate: json["taxModeBeginDate"],
    taxModeEndDate: json["taxModeEndDate"],
  );
}

