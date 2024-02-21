// To parse this JSON data, do
//
//     final companyDataWithTinResponse = companyDataWithTinResponseFromJson(jsonString);

import 'dart:convert';

CompanyDataWithTinResponse companyDataWithTinResponseFromJson(String str) => CompanyDataWithTinResponse.fromJson(json.decode(str));

String companyDataWithTinResponseToJson(CompanyDataWithTinResponse data) => json.encode(data.toJson());

class CompanyDataWithTinResponse {
  Company company;
  CompanyBillingAddress companyBillingAddress;
  List<dynamic> companyShippingAddresses;
  CompanyExtraInfo companyExtraInfo;
  Director director;
  RAddress directorAddress;
  RContact directorContact;
  dynamic accountant;
  dynamic accountantAddress;
  dynamic accountantContact;
  dynamic companyContact;
  dynamic companyLink;
  dynamic argos;
  List<CompanyBank> companyBanks;
  List<Founder> founders;

  CompanyDataWithTinResponse({
    required this.company,
    required this.companyBillingAddress,
    required this.companyShippingAddresses,
    required this.companyExtraInfo,
    required this.director,
    required this.directorAddress,
    required this.directorContact,
    required this.accountant,
    required this.accountantAddress,
    required this.accountantContact,
    required this.companyContact,
    required this.companyLink,
    required this.argos,
    required this.companyBanks,
    required this.founders,
  });

  factory CompanyDataWithTinResponse.fromJson(Map<String, dynamic> json) => CompanyDataWithTinResponse(
    company: Company.fromJson(json["company"]),
    companyBillingAddress: CompanyBillingAddress.fromJson(json["companyBillingAddress"]),
    companyShippingAddresses: List<dynamic>.from(json["companyShippingAddresses"].map((x) => x)),
    companyExtraInfo: CompanyExtraInfo.fromJson(json["companyExtraInfo"]),
    director: Director.fromJson(json["director"]),
    directorAddress: RAddress.fromJson(json["directorAddress"]),
    directorContact: RContact.fromJson(json["directorContact"]),
    accountant: json["accountant"],
    accountantAddress: json["accountantAddress"],
    accountantContact: json["accountantContact"],
    companyContact: json["companyContact"],
    companyLink: json["companyLink"],
    argos: json["argos"],
    companyBanks: List<CompanyBank>.from(json["companyBanks"].map((x) => CompanyBank.fromJson(x))),
    founders: List<Founder>.from(json["founders"].map((x) => Founder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "company": company.toJson(),
    "companyBillingAddress": companyBillingAddress.toJson(),
    "companyShippingAddresses": List<dynamic>.from(companyShippingAddresses.map((x) => x)),
    "companyExtraInfo": companyExtraInfo.toJson(),
    "director": director.toJson(),
    "directorAddress": directorAddress.toJson(),
    "directorContact": directorContact.toJson(),
    "accountant": accountant,
    "accountantAddress": accountantAddress,
    "accountantContact": accountantContact,
    "companyContact": companyContact,
    "companyLink": companyLink,
    "argos": argos,
    "companyBanks": List<dynamic>.from(companyBanks.map((x) => x.toJson())),
    "founders": List<dynamic>.from(founders.map((x) => x.toJson())),
  };
}

class Company {
  String name;
  String shortName;
  int opf;
  String opfName;
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
  dynamic taxModeName;
  int vatNumber;
  dynamic vatRegistrationDate;
  int taxpayerType;
  dynamic taxpayerTypeName;
  int businessType;
  int businessFund;
  int businessStructure;
  String businessStructureNameLt;
  String businessStructureNameRu;
  String businessStructureNameUz;
  String businessFundCurrency;
  String createdSysDate;
  String updatedSysDate;
  dynamic taxModeBeginDate;
  dynamic taxModeEndDate;

  Company({
    required this.name,
    required this.shortName,
    required this.opf,
    required this.opfName,
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
    required this.taxModeName,
    required this.vatNumber,
    required this.vatRegistrationDate,
    required this.taxpayerType,
    required this.taxpayerTypeName,
    required this.businessType,
    required this.businessFund,
    required this.businessStructure,
    required this.businessStructureNameLt,
    required this.businessStructureNameRu,
    required this.businessStructureNameUz,
    required this.businessFundCurrency,
    required this.createdSysDate,
    required this.updatedSysDate,
    required this.taxModeBeginDate,
    required this.taxModeEndDate,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"],
    shortName: json["shortName"],
    opf: json["opf"],
    opfName: json["opfName"],
    kfs: json["kfs"],
    tin: json["tin"],
    oked: json["oked"],
    soogu: json["soogu"],
    sooguRegistrator: json["sooguRegistrator"],
    registrationDate: json["registrationDate"],
    registrationNumber: json["registrationNumber"],
    reregistrationDate: json["reregistrationDate"],
    status: json["status"],
    statusUpdated: json["statusUpdated"],
    taxStatus: json["taxStatus"],
    liquidationDate: json["liquidationDate"],
    liquidationReason: json["liquidationReason"],
    suspensionDate: json["suspensionDate"],
    suspensionReason: json["suspensionReason"],
    taxMode: json["taxMode"],
    taxModeName: json["taxModeName"],
    vatNumber: json["vatNumber"],
    vatRegistrationDate: json["vatRegistrationDate"],
    taxpayerType: json["taxpayerType"],
    taxpayerTypeName: json["taxpayerTypeName"],
    businessType: json["businessType"],
    businessFund: json["businessFund"],
    businessStructure: json["businessStructure"],
    businessStructureNameLt: json["businessStructureNameLt"],
    businessStructureNameRu: json["businessStructureNameRu"],
    businessStructureNameUz: json["businessStructureNameUz"],
    businessFundCurrency: json["businessFundCurrency"],
    createdSysDate: json["createdSysDate"],
    updatedSysDate: json["updatedSysDate"],
    taxModeBeginDate: json["taxModeBeginDate"],
    taxModeEndDate: json["taxModeEndDate"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "shortName": shortName,
    "opf": opf,
    "opfName": opfName,
    "kfs": kfs,
    "tin": tin,
    "oked": oked,
    "soogu": soogu,
    "sooguRegistrator": sooguRegistrator,
    "registrationDate": registrationDate,
    "registrationNumber": registrationNumber,
    "reregistrationDate": reregistrationDate,
    "status": status,
    "statusUpdated": statusUpdated,
    "taxStatus": taxStatus,
    "liquidationDate": liquidationDate,
    "liquidationReason": liquidationReason,
    "suspensionDate": suspensionDate,
    "suspensionReason": suspensionReason,
    "taxMode": taxMode,
    "taxModeName": taxModeName,
    "vatNumber": vatNumber,
    "vatRegistrationDate": vatRegistrationDate,
    "taxpayerType": taxpayerType,
    "taxpayerTypeName": taxpayerTypeName,
    "businessType": businessType,
    "businessFund": businessFund,
    "businessStructure": businessStructure,
    "businessStructureNameLt": businessStructureNameLt,
    "businessStructureNameRu": businessStructureNameRu,
    "businessStructureNameUz": businessStructureNameUz,
    "businessFundCurrency": businessFundCurrency,
    "createdSysDate": createdSysDate,
    "updatedSysDate": updatedSysDate,
    "taxModeBeginDate": taxModeBeginDate,
    "taxModeEndDate": taxModeEndDate,
  };
}

class CompanyBank {
  String mfo;
  String paymentAccount;
  int status;
  String openDate;
  dynamic closeDate;
  int attribute;

  CompanyBank({
    required this.mfo,
    required this.paymentAccount,
    required this.status,
    required this.openDate,
    required this.closeDate,
    required this.attribute,
  });

  factory CompanyBank.fromJson(Map<String, dynamic> json) => CompanyBank(
    mfo: json["mfo"],
    paymentAccount: json["paymentAccount"],
    status: json["status"],
    openDate: json["openDate"],
    closeDate: json["closeDate"],
    attribute: json["attribute"],
  );

  Map<String, dynamic> toJson() => {
    "mfo": mfo,
    "paymentAccount": paymentAccount,
    "status": status,
    "openDate": openDate,
    "closeDate": closeDate,
    "attribute": attribute,
  };
}

class CompanyBillingAddress {
  int countryCode;
  String country;
  int sectorCode;
  String villageCode;
  String streetName;
  dynamic house;
  dynamic flat;
  int soato;
  dynamic cadastreNumber;
  String postcode;
  String nameUz;
  String nameRu;
  String nameLt;

  CompanyBillingAddress({
    required this.countryCode,
    required this.country,
    required this.sectorCode,
    required this.villageCode,
    required this.streetName,
    required this.house,
    required this.flat,
    required this.soato,
    required this.cadastreNumber,
    required this.postcode,
    required this.nameUz,
    required this.nameRu,
    required this.nameLt,
  });

  factory CompanyBillingAddress.fromJson(Map<String, dynamic> json) => CompanyBillingAddress(
    countryCode: json["countryCode"],
    country: json["country"],
    sectorCode: json["sectorCode"],
    villageCode: json["villageCode"],
    streetName: json["streetName"],
    house: json["house"],
    flat: json["flat"],
    soato: json["soato"],
    cadastreNumber: json["cadastreNumber"],
    postcode: json["postcode"],
    nameUz: json["nameUz"],
    nameRu: json["nameRu"],
    nameLt: json["nameLt"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "country": country,
    "sectorCode": sectorCode,
    "villageCode": villageCode,
    "streetName": streetName,
    "house": house,
    "flat": flat,
    "soato": soato,
    "cadastreNumber": cadastreNumber,
    "postcode": postcode,
    "nameUz": nameUz,
    "nameRu": nameRu,
    "nameLt": nameLt,
  };
}

class CompanyExtraInfo {
  dynamic companyExtraInfoId;
  int avgNumberEmployees;
  dynamic monthlyNumberEmployees;

  CompanyExtraInfo({
    required this.companyExtraInfoId,
    required this.avgNumberEmployees,
    required this.monthlyNumberEmployees,
  });

  factory CompanyExtraInfo.fromJson(Map<String, dynamic> json) => CompanyExtraInfo(
    companyExtraInfoId: json["companyExtraInfoId"],
    avgNumberEmployees: json["avgNumberEmployees"],
    monthlyNumberEmployees: json["monthlyNumberEmployees"],
  );

  Map<String, dynamic> toJson() => {
    "companyExtraInfoId": companyExtraInfoId,
    "avgNumberEmployees": avgNumberEmployees,
    "monthlyNumberEmployees": monthlyNumberEmployees,
  };
}

class Director {
  String lastName;
  String firstName;
  String middleName;
  int gender;
  String? genderName;
  String nationality;
  String citizenship;
  String passportSeries;
  String passportNumber;
  String pinfl;
  String tin;
  String? birthDate;
  String? individualId;
  String countryCode;

  Director({
    required this.lastName,
    required this.firstName,
    required this.middleName,
    required this.gender,
    this.genderName,
    required this.nationality,
    required this.citizenship,
    required this.passportSeries,
    required this.passportNumber,
    required this.pinfl,
    required this.tin,
    required this.birthDate,
    required this.individualId,
    required this.countryCode,
  });

  factory Director.fromJson(Map<String, dynamic> json) => Director(
    lastName: json["lastName"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    gender: json["gender"],
    genderName: json["genderName"],
    nationality: json["nationality"],
    citizenship: json["citizenship"],
    passportSeries: json["passportSeries"],
    passportNumber: json["passportNumber"],
    pinfl: json["pinfl"],
    tin: json["tin"],
    birthDate: json["birthDate"],
    individualId: json["individualId"],
    countryCode: json["countryCode"],
  );

  Map<String, dynamic> toJson() => {
    "lastName": lastName,
    "firstName": firstName,
    "middleName": middleName,
    "gender": gender,
    "genderName": genderName,
    "nationality": nationality,
    "citizenship": citizenship,
    "passportSeries": passportSeries,
    "passportNumber": passportNumber,
    "pinfl": pinfl,
    "tin": tin,
    "birthDate": birthDate,
    "individualId": individualId,
    "countryCode": countryCode,
  };
}

class RAddress {
  int countryCode;
  int sectorCode;
  String villageCode;
  String streetName;
  dynamic house;
  dynamic flat;
  int soato;
  String? cadastreNumber;
  dynamic postcode;

  RAddress({
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

  factory RAddress.fromJson(Map<String, dynamic> json) => RAddress(
    countryCode: json["countryCode"],
    sectorCode: json["sectorCode"],
    villageCode: json["villageCode"],
    streetName: json["streetName"],
    house: json["house"],
    flat: json["flat"],
    soato: json["soato"],
    cadastreNumber: json["cadastreNumber"],
    postcode: json["postcode"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "sectorCode": sectorCode,
    "villageCode": villageCode,
    "streetName": streetName,
    "house": house,
    "flat": flat,
    "soato": soato,
    "cadastreNumber": cadastreNumber,
    "postcode": postcode,
  };
}

class RContact {
  String phone;
  dynamic email;

  RContact({
    required this.phone,
    required this.email,
  });

  factory RContact.fromJson(Map<String, dynamic> json) => RContact(
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "email": email,
  };
}

class Founder {
  Director founderIndividual;
  RAddress founderAddress;
  RContact founderContact;
  dynamic founderLegal;

  Founder({
    required this.founderIndividual,
    required this.founderAddress,
    required this.founderContact,
    required this.founderLegal,
  });

  factory Founder.fromJson(Map<String, dynamic> json) => Founder(
    founderIndividual: Director.fromJson(json["founderIndividual"]),
    founderAddress: RAddress.fromJson(json["founderAddress"]),
    founderContact: RContact.fromJson(json["founderContact"]),
    founderLegal: json["founderLegal"],
  );

  Map<String, dynamic> toJson() => {
    "founderIndividual": founderIndividual.toJson(),
    "founderAddress": founderAddress.toJson(),
    "founderContact": founderContact.toJson(),
    "founderLegal": founderLegal,
  };
}
