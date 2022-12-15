// To parse this JSON data, do
//
//     final responseSubmitForm = responseSubmitFormFromJson(jsonString);

import 'dart:convert';

ResponseSubmitForm responseSubmitFormFromJson(String str) => ResponseSubmitForm.fromJson(json.decode(str));

String responseSubmitFormToJson(ResponseSubmitForm data) => json.encode(data.toJson());

class ResponseSubmitForm {
  ResponseSubmitForm({
    this.statusCode,
    this.statusDesc,
    this.transactionId,
    this.param15,
    this.param12,
  });

  String? statusCode;
  String? statusDesc;
  String? transactionId;
  String? param15;
  String? param12;

  factory ResponseSubmitForm.fromJson(Map<String, dynamic> json) => ResponseSubmitForm(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    statusDesc: json["statusDesc"] == null ? null : json["statusDesc"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    param15: json["param15"] == null ? null : json["param15"],
    param12: json["param12"] == null ? null : json["param12"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "statusDesc": statusDesc == null ? null : statusDesc,
    "transactionId": transactionId == null ? null : transactionId,
    "param15": param15 == null ? null : param15,
    "param12": param12 == null ? null : param12,
  };
}
