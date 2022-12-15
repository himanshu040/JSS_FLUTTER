// To parse this JSON data, do
//
//     final requestValidateRcForm = requestValidateRcFormFromMap(jsonString);

import 'dart:convert';

RequestValidateRcForm requestValidateRcFormFromMap(String str) => RequestValidateRcForm.fromMap(json.decode(str));

String requestValidateRcFormToMap(RequestValidateRcForm data) => json.encode(data.toMap());

class RequestValidateRcForm {
  RequestValidateRcForm({
    this.transactionId,
    this.param15,
    this.param11,
    this.source,
    this.param12,
    this.param13,
    this.param14,
  });

  String? transactionId;
  String? param15;
  int? param11;
  String? source;
  String? param12;
  String? param13;
  String? param14;

  factory RequestValidateRcForm.fromMap(Map<String, dynamic> json) => RequestValidateRcForm(
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    param15: json["param"] == null ? null : json["param"],
    param11: json["param11"] == null ? null : json["param11"],
    source: json["source"] == null ? null : json["source"],
    param12: json["param12"] == null ? null : json["param12"],
    param13: json["param13"] == null ? null : json["param13"],
    param14: json["param14"] == null ? null : json["param14"],
  );

  Map<String, dynamic> toMap() => {
    "transactionId": transactionId == null ? null : transactionId,
    "param15": param15 == null ? null : param15,
    "param11": param11 == null ? null : param11,
    "source": source == null ? null : source,
    "param12": param12 == null ? null : param12,
    "param13": param13 == null ? null : param13,
    "param14": param14 == null ? null : param14,
  };
}
