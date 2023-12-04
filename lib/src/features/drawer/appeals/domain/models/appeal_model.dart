import 'dart:io';

class AppealModel {
  final String sender;
  final String applierType;
  final String applierJshshir;
  final String? applierNumber;
  final String? applierFullname;
  final int? applierZipcode;
  final String? applierAddress;
  final int appealTypeId;
  final String? appealType;
  final String? appealSubtype;
  final String? appealDescription;
  final List<File?> appealFileList;
  final List<int> documentTypeIds;
  final String lang;
  final String lat;
  final String orgTin;

  AppealModel({
    required this.sender,
    required this.applierType,
    required this.applierJshshir,
    required this.applierFullname,
    required this.applierZipcode,
    required this.applierAddress,
    required this.appealTypeId,
    required this.appealType,
    required this.appealSubtype,
    required this.appealDescription,
    required this.applierNumber,
    required this.appealFileList,
    required this.documentTypeIds,
    required this.lang,
    required this.lat,
    required this.orgTin,
  });

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "applier_type": applierType,
        "applier_jshshir": applierJshshir,
        "applier_number": applierNumber,
        "applier_fullname": applierFullname,
        "applier_zipcode": applierZipcode,
        "applier_address": applierAddress,
        "appealType_id": appealTypeId,
        "appeal_type": appealType,
        "appeal_subtype": appealSubtype,
        "appeal_description": appealDescription,
        "appeal_file": appealFileList,
        "documentTypeIds": documentTypeIds,
        "lang": lang,
        "org_tin": orgTin,
      };
}
