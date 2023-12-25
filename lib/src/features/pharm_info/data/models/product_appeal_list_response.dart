// To parse this JSON data, do
//
//     final productAppealListResponse = productAppealListResponseFromJson(jsonString);

import 'dart:convert';

ProductAppealListResponse productAppealListResponseFromJson(String str) => ProductAppealListResponse.fromJson(json.decode(str));

class ProductAppealListResponse {
  List<ListElement> list;
  int total;

  ProductAppealListResponse({
    required this.list,
    required this.total,
  });

  factory ProductAppealListResponse.fromJson(Map<String, dynamic> json) => ProductAppealListResponse(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    total: json["total"] ??0,
  );
}

class ListElement {
  int id;
  String personType;
  String createJson;
  int pinfl;
  String fullname;
  dynamic phone;
  int zipcode;
  String address;
  String appealSubtype;
  String description;
  dynamic tin;
  dynamic orgName;
  dynamic orgPhone;
  dynamic email;
  String sender;
  dynamic orgtype;
  int userId;
  int appealTypesId;
  String lang;
  String lat;
  String? physicalTin;
  bool? checkbox;
  List<ForCreateFileDto> forCreateFileDtos;
  String mnumber;

  ListElement({
    required this.id,
    required this.personType,
    required this.createJson,
    required this.pinfl,
    required this.fullname,
    required this.phone,
    required this.zipcode,
    required this.address,
    required this.appealSubtype,
    required this.description,
    required this.tin,
    required this.orgName,
    required this.orgPhone,
    required this.email,
    required this.sender,
    required this.orgtype,
    required this.userId,
    required this.appealTypesId,
    required this.lang,
    required this.lat,
    required this.physicalTin,
    required this.checkbox,
    required this.forCreateFileDtos,
    required this.mnumber,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ??0,
    personType: json["personType"] ??'',
    createJson: json["createJson"] ??'',
    pinfl: json["pinfl"] ??0,
    fullname: json["fullname"] ??'',
    phone: json["phone"],
    zipcode: json["zipcode"] ??0,
    address: json["address"] ?? '',
    appealSubtype:json["appealSubtype"] ??'',
    description: json["description"] ??'',
    tin: json["tin"],
    orgName: json["orgName"],
    orgPhone: json["orgPhone"],
    email: json["email"],
    sender: json["sender"] ??'',
    orgtype: json["orgtype"],
    userId: json["userId"] ??0,
    appealTypesId: json["appealTypesId"] ??0,
    lang: json["lang"] ??'',
    lat: json["lat"] ??'',
    physicalTin: json["physical_tin"] ??'',
    checkbox: json["checkbox"]?? false,
    forCreateFileDtos: List<ForCreateFileDto>.from(json["forCreateFileDtos"].map((x) => ForCreateFileDto.fromJson(x))),
    mnumber: json["mnumber"] ??'',
  );
}


class ForCreateFileDto {
  int id;
  int fileContentId;
  String name;
  String originalName;
  int size;
  String mimeType;
  String uploadPath;
  String fileExtension;
  int documentId;
  String nameUz;
  String nameLt;
  String nameRu;
  dynamic nameEn;
  String code;
  String type;

  ForCreateFileDto({
    required this.id,
    required this.fileContentId,
    required this.name,
    required this.originalName,
    required this.size,
    required this.mimeType,
    required this.uploadPath,
    required this.fileExtension,
    required this.documentId,
    required this.nameUz,
    required this.nameLt,
    required this.nameRu,
    required this.nameEn,
    required this.code,
    required this.type,
  });

  factory ForCreateFileDto.fromJson(Map<String, dynamic> json) => ForCreateFileDto(
    id: json["id"] ??0,
    fileContentId: json["fileContent_id"] ??0,
    name: json["name"] ??'',
    originalName: json["originalName"] ??'',
    size: json["size"] ??0,
    mimeType: json["mimeType"] ??'',
    uploadPath: json["uploadPath"] ??'',
    fileExtension:json["fileExtension"]??'',
    documentId: json["document_id"] ??0,
    nameUz:json["nameUz"] ??'',
    nameLt:json["nameLt"] ??'',
    nameRu:json["nameRu"]??'',
    nameEn: json["nameEn"],
    code:json["code"] ??'',
    type: json["type"] ??'',
  );
}








