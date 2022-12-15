// To parse this JSON data, do
//
//     final responseBaseLocation = responseBaseLocationFromJson(jsonString);

import 'dart:convert';

ResponseBaseLocation responseBaseLocationFromJson(String str) => ResponseBaseLocation.fromJson(json.decode(str));

String responseBaseLocationToJson(ResponseBaseLocation data) => json.encode(data.toJson());

class ResponseBaseLocation {
  ResponseBaseLocation({
    this.statusCode,
    this.statusDesc,
    this.transactionId,
    this.inspectionStatus,
  });

  String? statusCode;
  String? statusDesc;
  String? transactionId;
  InspectionStatus? inspectionStatus;

  factory ResponseBaseLocation.fromJson(Map<String, dynamic> json) => ResponseBaseLocation(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    statusDesc: json["statusDesc"] == null ? null : json["statusDesc"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    inspectionStatus: json["inspectionStatus"] == null ? null : InspectionStatus.fromJson(json["inspectionStatus"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "statusDesc": statusDesc == null ? null : statusDesc,
    "transactionId": transactionId == null ? null : transactionId,
    "inspectionStatus": inspectionStatus == null ? null : inspectionStatus!.toJson(),
  };
}

class InspectionStatus {
  InspectionStatus({
    this.ngoDocs,
    this.infra,
    this.hr,
    this.skill,
  });

  NgoDocs? ngoDocs;
  NgoDocs? infra;
  NgoDocs? hr;
  NgoDocs? skill;

  factory InspectionStatus.fromJson(Map<String, dynamic> json) => InspectionStatus(
    ngoDocs: json["ngoDocs"] == null ? null : NgoDocs.fromJson(json["ngoDocs"]),
    infra: json["infra"]== null ? null : NgoDocs.fromJson(json["infra"]),
    hr: json["hr"]== null ? null : NgoDocs.fromJson(json["hr"]),
    skill: json["skill"]== null ? null : NgoDocs.fromJson(json["skill"]),
  );

  Map<String, dynamic> toJson() => {
    "ngoDocs": ngoDocs == null ? null : ngoDocs!.toJson(),
    "infra": infra== null ? null : infra!.toJson(),
    "hr": hr== null ? null : hr!.toJson(),
    "skill": skill== null ? null : skill!.toJson(),
  };
}

class NgoDocs {
  NgoDocs({
    this.status,
    this.compStatusList,
  });

  String? status;
  List<CompStatusList>? compStatusList;

  factory NgoDocs.fromJson(Map<String, dynamic> json) => NgoDocs(
    status: json["status"] == null ? null : json["status"],
    compStatusList: json["compStatusList"] == null ? null : List<CompStatusList>.from(json["compStatusList"].map((x) => CompStatusList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "compStatusList": compStatusList == null ? null : List<dynamic>.from(compStatusList!.map((x) => x.toJson())),
  };
}

class CompStatusList {
  CompStatusList({
    this.component,
    this.status,
  });

  String? component;
  String? status;

  factory CompStatusList.fromJson(Map<String, dynamic> json) => CompStatusList(
    component: json["component"] == null ? null : json["component"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "component": component == null ? null : component,
    "status": status == null ? null : status,
  };
}
