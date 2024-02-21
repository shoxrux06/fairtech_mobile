// To parse this JSON data, do
//
//     final personDataWithPinflResponse = personDataWithPinflResponseFromJson(jsonString);

import 'dart:convert';

PersonDataWithPinflEntity personDataWithPinflResponseFromJson(String str) => PersonDataWithPinflEntity.fromJson(json.decode(str));


class PersonDataWithPinflEntity {
  Director director;
  Company company;
  CompanyBillingAddress companyBillingAddress;

  PersonDataWithPinflEntity({
    required this.director,
    required this.company,
    required this.companyBillingAddress,
  });

  factory PersonDataWithPinflEntity.fromJson(Map<String, dynamic> json) => PersonDataWithPinflEntity(
    director: Director.fromJson(json["director"]),
    company: Company.fromJson(json["company"]),
    companyBillingAddress: CompanyBillingAddress.fromJson(json["companyBillingAddress"]),
  );
}

class Company {
  String pinfl;
  int statusId;
  String licenseBeginDate;
  int taxMode;
  String tin;
  int individualEntrepreneurType;

  Company({
    required this.pinfl,
    required this.statusId,
    required this.licenseBeginDate,
    required this.taxMode,
    required this.tin,
    required this.individualEntrepreneurType,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    pinfl: json["pinfl"],
    statusId: json["statusId"],
    licenseBeginDate: json["licenseBeginDate"],
    taxMode: json["taxMode"],
    tin: json["tin"],
    individualEntrepreneurType: json["individualEntrepreneurType"],
  );

}

class CompanyBank {
  String mfo;
  String paymentAccount;

  CompanyBank({
    required this.mfo,
    required this.paymentAccount,
  });

  factory CompanyBank.fromJson(Map<String, dynamic> json) => CompanyBank(
    mfo: json["mfo"],
    paymentAccount: json["paymentAccount"],
  );
}

class CompanyBillingAddress {
  int soato;
  String nameUz;
  String nameRu;
  String nameLt;

  CompanyBillingAddress({
    required this.soato,
    required this.nameUz,
    required this.nameRu,
    required this.nameLt,
  });

  factory CompanyBillingAddress.fromJson(Map<String, dynamic> json) => CompanyBillingAddress(
    soato: json["soato"],
    nameUz: json["nameUz"],
    nameRu: json["nameRu"],
    nameLt: json["nameLt"],
  );

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
}
