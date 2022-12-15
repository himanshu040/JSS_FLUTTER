// To parse this JSON data, do
//
//     final requestLogin = requestLoginFromMap(jsonString);

import 'dart:convert';

RequestLogin requestLoginFromMap(String str) => RequestLogin.fromMap(json.decode(str));

String requestLoginToMap(RequestLogin data) => json.encode(data.toMap());

class RequestLogin {
  RequestLogin({
    this.userPojo,
    this.source,
    this.transactionId,
  });

  UserPojo? userPojo;
  String? source;
  String? transactionId;

  factory RequestLogin.fromMap(Map<String, dynamic> json) => RequestLogin(
    userPojo: json["userPojo"] == null ? null : UserPojo.fromMap(json["userPojo"]),
    source: json["source"] == null ? null : json["source"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
  );

  Map<String, dynamic> toMap() => {
    "userPojo": userPojo == null ? null : userPojo!.toMap(),
    "source": source == null ? null : source,
    "transactionId": transactionId == null ? null : transactionId,
  };
}

class UserPojo {
  UserPojo({
    this.loginId,
    this.password,
    this.userType,
  });

  String? loginId;
  String? password;
  int? userType;

  factory UserPojo.fromMap(Map<String, dynamic> json) => UserPojo(
    loginId: json["loginId"] == null ? null : json["loginId"],
    password: json["password"] == null ? null : json["password"],
    userType: json["userType"] == null ? null : json["userType"],
  );

  Map<String, dynamic> toMap() => {
    "loginId": loginId == null ? null : loginId,
    "password": password == null ? null : password,
    "userType": userType == null ? null : userType,
  };
}
