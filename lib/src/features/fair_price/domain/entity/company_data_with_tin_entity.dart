// To parse this JSON data, do
//
//     final companyDataWithTinResponse = companyDataWithTinResponseFromJson(jsonString);

import 'dart:convert';

CompanyDataWithTinEntity companyDataWithTinResponseFromJson(String str) => CompanyDataWithTinEntity.fromJson(json.decode(str));

class CompanyDataWithTinEntity {
  Company company;
  CompanyBillingAddress companyBillingAddress;
  Director director;
  RContact directorContact;

  CompanyDataWithTinEntity({
    required this.company,
    required this.companyBillingAddress,
    required this.director,
    required this.directorContact,
  });

  factory CompanyDataWithTinEntity.fromJson(Map<String, dynamic> json) => CompanyDataWithTinEntity(
    company: Company.fromJson(json["company"]),
    companyBillingAddress: CompanyBillingAddress.fromJson(json["companyBillingAddress"]),
    director: Director.fromJson(json["director"]),
    directorContact: RContact.fromJson(json["directorContact"]),
  );

}

class Company {
  String shortName;
  String tin;
  int businessStructure;
  String businessStructureNameLt;
  String businessStructureNameRu;
  String businessStructureNameUz;

  Company({
    required this.shortName,
    required this.tin,
    required this.businessStructure,
    required this.businessStructureNameLt,
    required this.businessStructureNameRu,
    required this.businessStructureNameUz,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    shortName: json["shortName"] ?? '---',
    tin: json["tin"] ?? '---',
    businessStructure: json["businessStructure"] ??0,
    businessStructureNameLt: json["businessStructureNameLt"] ?? '',
    businessStructureNameRu: json["businessStructureNameRu"] ??'',
    businessStructureNameUz: json["businessStructureNameUz"] ??'',
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
    soato: json["soato"] ??0,
    nameUz: json["nameUz"] ??'---',
    nameRu: json["nameRu"] ?? '---',
    nameLt: json["nameLt"] ?? '---',
  );
}

class Director {
  String lastName;
  String firstName;
  String middleName;

  Director({
    required this.lastName,
    required this.firstName,
    required this.middleName,
  });

  factory Director.fromJson(Map<String, dynamic> json) => Director(
    lastName: json["lastName"] ??'',
    firstName: json["firstName"] ?? '-',
    middleName: json["middleName"] ?? '-',
  );
}


class RContact {
  String phone;

  RContact({
    required this.phone,
  });

  factory RContact.fromJson(Map<String, dynamic> json) => RContact(
    phone: json["phone"] ?? '',
  );
}

