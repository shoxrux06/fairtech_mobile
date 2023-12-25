import 'dart:io';

class AppealModel {
  final String sender;
  final String applierType;
  final String applierJshshir;
  final String? applierFullname;
  final int? applierZipcode;
  final String? applierAddress;
  final String? applierPhone;
  final int appealTypeId;
  final String? appealType;
  final String? appealSubtype;
  final String? appealDescription;
  final List<File?> appealFileList;
  final List<int> documentTypeIds;
  final String lang;
  final String lat;
  final String latAddress;
  final String orgTin;
  final String physicalTin;
  final bool checkbox;

  AppealModel({
    required this.sender,
    required this.applierType,
    required this.applierJshshir,
    required this.applierFullname,
    required this.applierZipcode,
    required this.applierAddress,
    required this.applierPhone,
    required this.appealTypeId,
    required this.appealType,
    required this.appealSubtype,
    required this.appealDescription,
    required this.appealFileList,
    required this.documentTypeIds,
    required this.lang,
    required this.lat,
    required this.latAddress,
    required this.orgTin,
    required this.physicalTin,
    required this.checkbox,
  });
}
