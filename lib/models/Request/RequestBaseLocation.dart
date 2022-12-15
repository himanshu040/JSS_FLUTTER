// To parse this JSON data, do
//
//     final RequestBaseLocation = RequestBaseLocationFromMap(jsonString);

import 'dart:convert';

RequestBaseLocation RequestBaseLocationFromMap(String str) => RequestBaseLocation.fromMap(json.decode(str));

String RequestBaseLocationToMap(RequestBaseLocation data) => json.encode(data.toMap());

class RequestBaseLocation {
  RequestBaseLocation({
    this.transactionId,
    this.param15,
    this.param11,
    this.source,
    this.param13,
    this.param14
  });

  String? transactionId;
  String? param15;
  int? param11;
  String? source;
  String? param13;
  String? param14;

  factory RequestBaseLocation.fromMap(Map<String, dynamic> json) => RequestBaseLocation(
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    param15: json["param"] == null ? null : json["param"],
    param11: json["param11"] == null ? null : json["param11"],
    source: json["source"] == null ? null : json["source"],
  );

  Map<String, dynamic> toMap() => {
    "transactionId": transactionId == null ? null : transactionId,
    "param15": param15 == null ? null : param15,
    "param11": param11 == null ? null : param11,
    "source": source == null ? null : source,
    "param13": param13 == null ? null : param13,
    "param14": param14 == null ? null : param14,
  };
}
