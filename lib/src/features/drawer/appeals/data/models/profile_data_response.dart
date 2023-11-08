// To parse this JSON data, do
//
//     final profileDataResponse = profileDataResponseFromJson(jsonString);

import 'dart:convert';

ProfileDataResponse profileDataResponseFromJson(String str) => ProfileDataResponse.fromJson(json.decode(str));

String profileDataResponseToJson(ProfileDataResponse data) => json.encode(data.toJson());

class ProfileDataResponse {
  int id;
  String userId;
  String password;
  String firstName;
  String lastName;
  String middleName;
  String phoneNumber;
  String pinfl;
  dynamic inn;
  String username;
  String birthday;
  String birthPlace2;
  String passportSeries;
  String passportNumber;
  String passportPhoto;
  dynamic accountPhoto;
  String birthPlace;
  String ctzn;
  String gd;
  String mail;
  String userType;
  int secondTableId;
  String passportEndDate;
  String passportGivenDate;
  String passportGivenWho;
  String natn;
  String perAdress;

  ProfileDataResponse({
    required this.id,
    required this.userId,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.phoneNumber,
    required this.pinfl,
    required this.inn,
    required this.username,
    required this.birthday,
    required this.birthPlace2,
    required this.passportSeries,
    required this.passportNumber,
    required this.passportPhoto,
    required this.accountPhoto,
    required this.birthPlace,
    required this.ctzn,
    required this.gd,
    required this.mail,
    required this.userType,
    required this.secondTableId,
    required this.passportEndDate,
    required this.passportGivenDate,
    required this.passportGivenWho,
    required this.natn,
    required this.perAdress,
  });

  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) => ProfileDataResponse(
    id: json["id"] ?? 0,
    userId: json["userId"] ??'',
    password: json["password"] ??'',
    firstName: json["firstName"] ??'',
    lastName: json["lastName"] ??'',
    middleName: json["middleName"] ??'',
    phoneNumber: json["phoneNumber"] ??'',
    pinfl: json["pinfl"] ??'',
    inn: json["inn"] ??'',
    username: json["username"] ??'',
    birthday: json["birthday"] ??'',
    birthPlace2: json["birthPlace2"] ??'',
    passportSeries: json["passportSeries"] ??'',
    passportNumber: json["passportNumber"] ??'',
    passportPhoto: json["passportPhoto"] ??'',
    accountPhoto: json["accountPhoto"] ??'',
    birthPlace: json["birthPlace"] ??"",
    ctzn: json["ctzn"] ??'',
    gd: json["gd"] ??'',
    mail: json["mail"] ??'',
    userType: json["userType"] ??'',
    secondTableId: json["secondTable_id"] ??'',
    passportEndDate: json["passportEndDate"] ??'',
    passportGivenDate: json["passportGivenDate"] ??'',
    passportGivenWho: json["passportGivenWho"]?? '',
    natn: json["natn"] ??'',
    perAdress: json["perAdress"] ??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "middleName": middleName,
    "phoneNumber": phoneNumber,
    "pinfl": pinfl,
    "inn": inn,
    "username": username,
    "birthday": birthday,
    "birthPlace2": birthPlace2,
    "passportSeries": passportSeries,
    "passportNumber": passportNumber,
    "passportPhoto": passportPhoto,
    "accountPhoto": accountPhoto,
    "birthPlace": birthPlace,
    "ctzn": ctzn,
    "gd": gd,
    "mail": mail,
    "userType": userType,
    "secondTable_id": secondTableId,
    "passportEndDate": passportEndDate,
    "passportGivenDate": passportGivenDate,
    "passportGivenWho": passportGivenWho,
    "natn": natn,
    "perAdress": perAdress,
  };
}
