// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    this.statusCode,
    this.statusDesc,
    this.param11,
    this.transactionId,
    this.parentId,
    this.userType,
  });

  String? statusCode;
  String? statusDesc;
  int? param11;
  String? transactionId;
  int? parentId;
  int? userType;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    statusDesc: json["statusDesc"] == null ? null : json["statusDesc"],
    param11: json["param11"] == null ? null : json["param11"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    parentId: json["parentId"] == null ? null : json["parentId"],
    userType: json["userType"] == null ? null : json["userType"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "statusDesc": statusDesc == null ? null : statusDesc,
    "param11": param11 == null ? null : param11,
    "transactionId": transactionId == null ? null : transactionId,
    "parentId": parentId == null ? null : parentId,
    "userType": userType == null ? null : userType,
  };
}
