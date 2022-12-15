// To parse this JSON data, do
//
//     final requestDetails = requestDetailsFromMap(jsonString);

import 'dart:convert';

RequestDetails requestDetailsFromMap(String str) => RequestDetails.fromMap(json.decode(str));

String requestDetailsToMap(RequestDetails data) => json.encode(data.toMap());

class RequestDetails {
  RequestDetails({
    this.transactionId,
    this.param15,
    this.source,
    this.param11,
    this.param13,
  });

  String? transactionId;
  String? param15;
  String? source;
  int? param11;
  String? param13;

  factory RequestDetails.fromMap(Map<String, dynamic> json) => RequestDetails(
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    param15: json["param15"] == null ? null : json["param15"],
    source: json["source"] == null ? null : json["source"],
    param11: json["param11"] == null ? null : json["param11"],
    param13: json["param13"] == null ? null : json["param13"],
  );

  Map<String, dynamic> toMap() => {
    "transactionId": transactionId == null ? null : transactionId,
    "param15": param15 == null ? null : param15,
    "source": source == null ? null : source,
    "param11": param11 == null ? null : param11,
    "param13": param13 == null ? null : param13,
  };
}
