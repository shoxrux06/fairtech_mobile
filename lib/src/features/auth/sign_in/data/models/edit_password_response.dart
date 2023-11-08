// To parse this JSON data, do
//
//     final editPasswordResponse = editPasswordResponseFromJson(jsonString);

import 'dart:convert';

EditPasswordResponse editPasswordResponseFromJson(String str) => EditPasswordResponse.fromJson(json.decode(str));

String editPasswordResponseToJson(EditPasswordResponse data) => json.encode(data.toJson());

class EditPasswordResponse {
  int id;
  String username;
  String password;
  dynamic token;
  dynamic firstName;
  dynamic lastName;
  dynamic middleName;
  dynamic photo;
  dynamic roles;
  dynamic permissions;

  EditPasswordResponse({
    required this.id,
    required this.username,
    required this.password,
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.photo,
    required this.roles,
    required this.permissions,
  });

  factory EditPasswordResponse.fromJson(Map<String, dynamic> json) => EditPasswordResponse(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    token: json["token"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    middleName: json["middleName"],
    photo: json["photo"],
    roles: json["roles"],
    permissions: json["permissions"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "token": token,
    "firstName": firstName,
    "lastName": lastName,
    "middleName": middleName,
    "photo": photo,
    "roles": roles,
    "permissions": permissions,
  };
}
