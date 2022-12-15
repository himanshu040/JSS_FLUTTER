// To parse this JSON data, do
//
//     final requestSubmitForm = requestSubmitFormFromMap(jsonString);

import 'dart:convert';

RequestSubmitForm requestSubmitFormFromMap(String str) => RequestSubmitForm.fromMap(json.decode(str));

String requestSubmitFormToMap(RequestSubmitForm data) => json.encode(data.toMap());

class RequestSubmitForm {
  RequestSubmitForm({
    this.transactionId,
    this.param15,
    this.param11,
    this.source,
    this.param12,
    this.param13,
    this.param14,
    this.component,
  });

  String? transactionId;
  String? param15;
  int? param11;
  String? source;
  String? param12;
  String? param13;
  String? param14;
  Components? component;

  factory RequestSubmitForm.fromMap(Map<String, dynamic> json) => RequestSubmitForm(
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    param15: json["param15"] == null ? null : json["param15"],
    param11: json["param11"] == null ? null : json["param11"],
    source: json["source"] == null ? null : json["source"],
    param12: json["param12"] == null ? null : json["param12"],
    param13: json["param13"] == null ? null : json["param13"],
    param14: json["param14"] == null ? null : json["param14"],
    component: json["component"] == null ? null : Components.fromMap(json["component"]),
  );

  Map<String, dynamic> toMap() => {
    "transactionId": transactionId == null ? null : transactionId,
    "param15": param15 == null ? null : param15,
    "param11": param11 == null ? null : param11,
    "source": source == null ? null : source,
    "param12": param12 == null ? null : param12,
    "param13": param13 == null ? null : param13,
    "param14": param14 == null ? null : param14,
    "component": component == null ? null : component!.toMap(),
  };
}

class Components {
  Components({
    this.isVerified,
    this.remarks,
    this.compDetails,
  });

  bool? isVerified;
  String? remarks;
  List<CompDetails>? compDetails;

  factory Components.fromMap(Map<String, dynamic> json) => Components(
    isVerified: json["isVerified"] == null ? null : json["isVerified"],
    remarks: json["remarks"] == null ? null : json["remarks"],
    compDetails: json["compDetails"] == null ? null : List<CompDetails>.from(json["compDetails"].map((x) => CompDetails.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "isVerified": isVerified == null ? null : isVerified,
    "remarks": remarks == null ? null : remarks,
    "compDetails": compDetails == null ? null : List<dynamic>.from(compDetails!.map((x) => x.toMap())),
  };
}

class CompDetails {
  CompDetails();

  factory CompDetails.fromMap(Map<String, dynamic> json) => CompDetails(
  );

  Map<String, dynamic> toMap() => {
  };
}
