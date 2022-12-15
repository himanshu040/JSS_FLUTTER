// To parse this JSON data, do
//
//     final responseDetails = responseDetailsFromMap(jsonString);

import 'dart:convert';

ResponseDetails responseDetailsFromMap(String str) => ResponseDetails.fromMap(json.decode(str));

String responseDetailsToMap(ResponseDetails data) => json.encode(data.toMap());

class ResponseDetails {
  ResponseDetails({
    this.statusCode,
    this.statusDesc,
    this.transactionId,
    this.darpanDetails,
  });

  String? statusCode;
  String? statusDesc;
  String? transactionId;
  DarpanDetails? darpanDetails;

  factory ResponseDetails.fromMap(Map<String, dynamic> json) => ResponseDetails(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    statusDesc: json["statusDesc"] == null ? null : json["statusDesc"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    darpanDetails: json["darpanDetails"] == null ? null : DarpanDetails.fromMap(json["darpanDetails"]),
  );

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode == null ? null : statusCode,
    "statusDesc": statusDesc == null ? null : statusDesc,
    "transactionId": transactionId == null ? null : transactionId,
    "darpanDetails": darpanDetails == null ? null : darpanDetails!.toMap(),
  };

  factory ResponseDetails.fromJson(Map<String, dynamic> json) => ResponseDetails(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    statusDesc: json["statusDesc"] == null ? null : json["statusDesc"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    darpanDetails: json["darpanDetails"] == null ? null : DarpanDetails.fromJson(json["darpanDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "statusDesc": statusDesc == null ? null : statusDesc,
    "transactionId": transactionId == null ? null : transactionId,
    "darpanDetails": darpanDetails == null ? null : darpanDetails!.toJson(),
  };
}

class DarpanDetails {
  DarpanDetails({
    this.darpanId,
    this.agencyName,
    this.contactPersonName,
    this.contactPersonEmail,
    this.contactPersonMobile,
    this.pan,
    this.address,
  });

  String? darpanId;
  String? agencyName;
  String? contactPersonName;
  String? contactPersonEmail;
  String? contactPersonMobile;
  String? pan;
  Address? address;

  factory DarpanDetails.fromMap(Map<String, dynamic> json) => DarpanDetails(
    darpanId: json["darpanId"] == null ? null : json["darpanId"],
    agencyName: json["agencyName"] == null ? null : json["agencyName"],
    contactPersonName: json["contactPersonName"] == null ? null : json["contactPersonName"],
    contactPersonEmail: json["contactPersonEmail"] == null ? null : json["contactPersonEmail"],
    contactPersonMobile: json["contactPersonMobile"] == null ? null : json["contactPersonMobile"],
    pan: json["pan"] == null ? null : json["pan"],
    address: json["address"] == null ? null : Address.fromMap(json["address"]),
  );

  Map<String, dynamic> toMap() => {
    "darpanId": darpanId == null ? null : darpanId,
    "agencyName": agencyName == null ? null : agencyName,
    "contactPersonName": contactPersonName == null ? null : contactPersonName,
    "contactPersonEmail": contactPersonEmail == null ? null : contactPersonEmail,
    "contactPersonMobile": contactPersonMobile == null ? null : contactPersonMobile,
    "pan": pan == null ? null : pan,
    "address": address == null ? null : address!.toMap(),
  };
  factory DarpanDetails.fromJson(Map<String, dynamic> json) => DarpanDetails(
    darpanId: json["darpanId"] == null ? null : json["darpanId"],
    agencyName: json["agencyName"] == null ? null : json["agencyName"],
    contactPersonName: json["contactPersonName"] == null ? null : json["contactPersonName"],
    contactPersonEmail: json["contactPersonEmail"] == null ? null : json["contactPersonEmail"],
    contactPersonMobile: json["contactPersonMobile"] == null ? null : json["contactPersonMobile"],
    pan: json["pan"] == null ? null : json["pan"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "darpanId": darpanId == null ? null : darpanId,
    "agencyName": agencyName == null ? null : agencyName,
    "contactPersonName": contactPersonName == null ? null : contactPersonName,
    "contactPersonEmail": contactPersonEmail == null ? null : contactPersonEmail,
    "contactPersonMobile": contactPersonMobile == null ? null : contactPersonMobile,
    "pan": pan == null ? null : pan,
    "address": address == null ? null : address!.toJson(),
  };
}

class Address {
  Address({
    this.state,
    this.district,
    this.subdistrict,
    this.address,
    this.pincode,
  });

  String? state;
  String? district;
  String? subdistrict;
  String? address;
  String? pincode;

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    state: json["state"] == null ? null : json["state"],
    district: json["district"] == null ? null : json["district"],
    subdistrict: json["subdistrict"] == null ? null : json["subdistrict"],
    address: json["address"] == null ? null : json["address"],
    pincode: json["pincode"] == null ? null : json["pincode"],
  );

  Map<String, dynamic> toMap() => {
    "state": state == null ? null : state,
    "district": district == null ? null : district,
    "subdistrict": subdistrict == null ? null : subdistrict,
    "address": address == null ? null : address,
    "pincode": pincode == null ? null : pincode,
  };
  factory Address.fromJson(Map<String, dynamic> json) => Address(
    state: json["state"] == null ? null : json["state"],
    district: json["district"] == null ? null : json["district"],
    subdistrict: json["subdistrict"] == null ? null : json["subdistrict"],
    address: json["address"] == null ? null : json["address"],
    pincode: json["pincode"] == null ? null : json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "state": state == null ? null : state,
    "district": district == null ? null : district,
    "subdistrict": subdistrict == null ? null : subdistrict,
    "address": address == null ? null : address,
    "pincode": pincode == null ? null : pincode,
  };
}

