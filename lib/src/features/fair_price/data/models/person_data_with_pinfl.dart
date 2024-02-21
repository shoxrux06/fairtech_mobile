// To parse this JSON data, do
//
//     final personDataWithPinflResponse = personDataWithPinflResponseFromJson(jsonString);

import 'dart:convert';

PersonDataWithPinflResponse personDataWithPinflResponseFromJson(String str) => PersonDataWithPinflResponse.fromJson(json.decode(str));

String personDataWithPinflResponseToJson(PersonDataWithPinflResponse data) => json.encode(data.toJson());

class PersonDataWithPinflResponse {
  List<CompanyBank> companyBanks;
  Director director;
  Company company;
  CompanyBillingAddress companyBillingAddress;
  dynamic companyShippingAddresses;

  PersonDataWithPinflResponse({
    required this.companyBanks,
    required this.director,
    required this.company,
    required this.companyBillingAddress,
    required this.companyShippingAddresses,
  });

  factory PersonDataWithPinflResponse.fromJson(Map<String, dynamic> json) => PersonDataWithPinflResponse(
    companyBanks: List<CompanyBank>.from(json["companyBanks"].map((x) => CompanyBank.fromJson(x))),
    director: Director.fromJson(json["director"]),
    company: Company.fromJson(json["company"]),
    companyBillingAddress: CompanyBillingAddress.fromJson(json["companyBillingAddress"]),
    companyShippingAddresses: json["companyShippingAddresses"],
  );

  Map<String, dynamic> toJson() => {
    "companyBanks": List<dynamic>.from(companyBanks.map((x) => x.toJson())),
    "director": director.toJson(),
    "company": company.toJson(),
    "companyBillingAddress": companyBillingAddress.toJson(),
    "companyShippingAddresses": companyShippingAddresses,
  };
}

class Company {
  String pinfl;
  dynamic lastApplicationId;
  dynamic opf;
  dynamic reRegistrationDate;
  int reestrId;
  dynamic suspensionDate;
  dynamic suspensionReason;
  dynamic certificateDocNumber;
  String licenseEndDate;
  dynamic liquidationReason;
  dynamic liquidationDate;
  int activityCode;
  int statusId;
  dynamic taxpayerType;
  String licenseBeginDate;
  int taxMode;
  String tin;
  String registrationDate;
  int individualEntrepreneurType;
  dynamic applicationId;
  dynamic statusUpdated;
  String sooguRegistrator;
  dynamic vatNumber;

  Company({
    required this.pinfl,
    required this.lastApplicationId,
    required this.opf,
    required this.reRegistrationDate,
    required this.reestrId,
    required this.suspensionDate,
    required this.suspensionReason,
    required this.certificateDocNumber,
    required this.licenseEndDate,
    required this.liquidationReason,
    required this.liquidationDate,
    required this.activityCode,
    required this.statusId,
    required this.taxpayerType,
    required this.licenseBeginDate,
    required this.taxMode,
    required this.tin,
    required this.registrationDate,
    required this.individualEntrepreneurType,
    required this.applicationId,
    required this.statusUpdated,
    required this.sooguRegistrator,
    required this.vatNumber,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    pinfl: json["pinfl"],
    lastApplicationId: json["lastApplicationId"],
    opf: json["opf"],
    reRegistrationDate: json["reRegistrationDate"],
    reestrId: json["reestrId"],
    suspensionDate: json["suspensionDate"],
    suspensionReason: json["suspensionReason"],
    certificateDocNumber: json["certificateDocNumber"],
    licenseEndDate: json["licenseEndDate"],
    liquidationReason: json["liquidationReason"],
    liquidationDate: json["liquidationDate"],
    activityCode: json["activityCode"],
    statusId: json["statusId"],
    taxpayerType: json["taxpayerType"],
    licenseBeginDate: json["licenseBeginDate"],
    taxMode: json["taxMode"],
    tin: json["tin"],
    registrationDate: json["registrationDate"],
    individualEntrepreneurType: json["individualEntrepreneurType"],
    applicationId: json["applicationId"],
    statusUpdated: json["statusUpdated"],
    sooguRegistrator: json["sooguRegistrator"],
    vatNumber: json["vatNumber"],
  );

  Map<String, dynamic> toJson() => {
    "pinfl": pinfl,
    "lastApplicationId": lastApplicationId,
    "opf": opf,
    "reRegistrationDate": reRegistrationDate,
    "reestrId": reestrId,
    "suspensionDate": suspensionDate,
    "suspensionReason": suspensionReason,
    "certificateDocNumber": certificateDocNumber,
    "licenseEndDate": licenseEndDate,
    "liquidationReason": liquidationReason,
    "liquidationDate": liquidationDate,
    "activityCode": activityCode,
    "statusId": statusId,
    "taxpayerType": taxpayerType,
    "licenseBeginDate": licenseBeginDate,
    "taxMode": taxMode,
    "tin": tin,
    "registrationDate": registrationDate,
    "individualEntrepreneurType": individualEntrepreneurType,
    "applicationId": applicationId,
    "statusUpdated": statusUpdated,
    "sooguRegistrator": sooguRegistrator,
    "vatNumber": vatNumber,
  };
}

class CompanyBank {
  String mfo;
  String paymentAccount;
  dynamic name;

  CompanyBank({
    required this.mfo,
    required this.paymentAccount,
    required this.name,
  });

  factory CompanyBank.fromJson(Map<String, dynamic> json) => CompanyBank(
    mfo: json["mfo"],
    paymentAccount: json["paymentAccount"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "mfo": mfo,
    "paymentAccount": paymentAccount,
    "name": name,
  };
}

class CompanyBillingAddress {
  String streetName;
  int countryCode;
  int sectorCode;
  dynamic flat;
  int soato;
  String cadastreNumber;
  dynamic postcode;
  String house;
  String villageCode;
  String nameUz;
  String nameRu;
  String nameLt;

  CompanyBillingAddress({
    required this.streetName,
    required this.countryCode,
    required this.sectorCode,
    required this.flat,
    required this.soato,
    required this.cadastreNumber,
    required this.postcode,
    required this.house,
    required this.villageCode,
    required this.nameUz,
    required this.nameRu,
    required this.nameLt,
  });

  factory CompanyBillingAddress.fromJson(Map<String, dynamic> json) => CompanyBillingAddress(
    streetName: json["streetName"],
    countryCode: json["countryCode"],
    sectorCode: json["sectorCode"],
    flat: json["flat"],
    soato: json["soato"],
    cadastreNumber: json["cadastreNumber"],
    postcode: json["postcode"],
    house: json["house"],
    villageCode: json["villageCode"],
    nameUz: json["nameUz"],
    nameRu: json["nameRu"],
    nameLt: json["nameLt"],
  );

  Map<String, dynamic> toJson() => {
    "streetName": streetName,
    "countryCode": countryCode,
    "sectorCode": sectorCode,
    "flat": flat,
    "soato": soato,
    "cadastreNumber": cadastreNumber,
    "postcode": postcode,
    "house": house,
    "villageCode": villageCode,
    "nameUz": nameUz,
    "nameRu": nameRu,
    "nameLt": nameLt,
  };
}

class Director {
  String pinfl;
  String tin;

  Director({
    required this.pinfl,
    required this.tin,
  });

  factory Director.fromJson(Map<String, dynamic> json) => Director(
    pinfl: json["pinfl"],
    tin: json["tin"],
  );

  Map<String, dynamic> toJson() => {
    "pinfl": pinfl,
    "tin": tin,
  };
}
