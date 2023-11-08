import 'dart:io';

class AppealModel{
  final String applierType;
  final String applierJshshir;
  final String? applierNumber;
  final String? applierFullname;
  final int? applierZipcode;
  final String? applierAddress;
  final String? appealType;
  final String? appealSubtype;
  final String? appealDescription;
  final List<File?> appealFileList;

  AppealModel({required this.applierType, required this.applierJshshir, required this.applierFullname, required this.applierZipcode, required this.applierAddress, required this.appealType, required this.appealSubtype, required this.appealDescription, required this.applierNumber, required this.appealFileList});

  Map<String, dynamic> toJson() => {
    "applier_type": applierType,
    "applier_jshshir": applierJshshir,
    "applier_number": applierNumber,
    "applier_fullname": applierFullname,
    "applier_zipcode": applierZipcode,
    "applier_address": applierAddress,
    "appeal_type": appealType,
    "appeal_subtype": appealSubtype,
    "appeal_description": appealDescription,
    "appeal_file": appealFileList,
  };

}