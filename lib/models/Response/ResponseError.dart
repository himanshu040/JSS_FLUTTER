// To parse this JSON data, do
//
//     final responseErrorJ = responseErrorJFromJson(jsonString);

import 'dart:convert';

ResponseErrorJ responseErrorJFromJson(String str) =>
    ResponseErrorJ.fromJson(json.decode(str));

String responseErrorJToJson(ResponseErrorJ data) => json.encode(data.toJson());

class ResponseErrorJ {
  ResponseErrorJ({
    required this.errors,
  });

  List<Error> errors;

  factory ResponseErrorJ.fromJson(Map<String, dynamic> json) => ResponseErrorJ(
    errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
  };
}

class Error {
  Error({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}
