// To parse this JSON data, do
//
//     final responseFileUpload = responseFileUploadFromJson(jsonString);

import 'dart:convert';

ResponseFileUpload responseFileUploadFromJson(String str) => ResponseFileUpload.fromJson(json.decode(str));

String responseFileUploadToJson(ResponseFileUpload data) => json.encode(data.toJson());

class ResponseFileUpload {
  ResponseFileUpload({
    this.statusCode,
    this.statusDesc,
    this.recordId,
    this.transactionId,
  });

  String? statusCode;
  String? statusDesc;
  int? recordId;
  String? transactionId;

  factory ResponseFileUpload.fromJson(Map<String, dynamic> json) => ResponseFileUpload(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    statusDesc: json["statusDesc"] == null ? null : json["statusDesc"],
    recordId: json["recordId"] == null ? null : json["recordId"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "statusDesc": statusDesc == null ? null : statusDesc,
    "recordId": recordId == null ? null : recordId,
    "transactionId": transactionId == null ? null : transactionId,
  };
}
