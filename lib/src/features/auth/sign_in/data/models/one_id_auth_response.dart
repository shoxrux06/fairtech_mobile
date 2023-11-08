// To parse this JSON data, do
//
//     final oneIdAuthResponse = oneIdAuthResponseFromJson(jsonString);

import 'dart:convert';

OneIdAuthResponse oneIdAuthResponseFromJson(String str) => OneIdAuthResponse.fromJson(json.decode(str));

class OneIdAuthResponse {
  int id;
  String username;
  String password;
  String token;
  String firstName;
  String lastName;
  String middleName;
  dynamic photo;
  List<Role> roles;
  List<String> permissions;

  OneIdAuthResponse({
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

  factory OneIdAuthResponse.fromJson(Map<String, dynamic> json) => OneIdAuthResponse(
    id: json["id"] ?? 0,
    username: json["username"] ??'',
    password: json["password"] ??'',
    token: json["token"] ??'',
    firstName: json["firstName"] ??'',
    lastName: json["lastName"] ??'',
    middleName: json["middleName"] ??'',
    photo: json["photo"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    permissions: List<String>.from(json["permissions"].map((x) => x)),
  );

}

class Role {
  int id;
  String name;
  String code;
  dynamic description;
  List<int> permissionIds;

  Role({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.permissionIds,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"] ??0,
    name: json["name"] ??'',
    code: json["code"] ??'',
    description: json["description"],
    permissionIds: List<int>.from(json["permissionIds"].map((x) => x)),
  );

}
