// To parse this JSON data, do
//
//     final requestSubmitFormWithFiles = requestSubmitFormWithFilesFromMap(jsonString);

import 'dart:convert';

RequestSubmitFormWithFiles requestSubmitFormWithFilesFromMap(String str) => RequestSubmitFormWithFiles.fromMap(json.decode(str));

String requestSubmitFormWithFilesToMap(RequestSubmitFormWithFiles data) => json.encode(data.toMap());

class RequestSubmitFormWithFiles {
  RequestSubmitFormWithFiles({
    this.transactionId,
    this.param,
    this.param11,
    this.source,
    this.param12,
    this.param13,
    this.param14,
    this.component,
  });

  String? transactionId;
  String? param;
  int? param11;
  String? source;
  String? param12;
  String? param13;
  String? param14;
  Component? component;

  factory RequestSubmitFormWithFiles.fromMap(Map<String, dynamic> json) => RequestSubmitFormWithFiles(
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    param: json["param"] == null ? null : json["param"],
    param11: json["param11"] == null ? null : json["param11"],
    source: json["source"] == null ? null : json["source"],
    param12: json["param12"] == null ? null : json["param12"],
    param13: json["param13"] == null ? null : json["param13"],
    param14: json["param14"] == null ? null : json["param14"],
    component: json["component"] == null ? null : Component.fromMap(json["component"]),
  );

  Map<String, dynamic> toMap() => {
    "transactionId": transactionId == null ? null : transactionId,
    "param": param == null ? null : param,
    "param11": param11 == null ? null : param11,
    "source": source == null ? null : source,
    "param12": param12 == null ? null : param12,
    "param13": param13 == null ? null : param13,
    "param14": param14 == null ? null : param14,
    "component": component == null ? null : component!.toMap(),
  };
}

class Component {
  Component({
    this.isVerified,
    this.remarks,
    this.compDetails,
  });

  bool? isVerified;
  String? remarks;
  List<CompDetail>? compDetails;

  factory Component.fromMap(Map<String, dynamic> json) => Component(
    isVerified: json["isVerified"] == null ? null : json["isVerified"],
    remarks: json["remarks"] == null ? null : json["remarks"],
    compDetails: json["compDetails"] == null ? null : List<CompDetail>.from(json["compDetails"].map((x) => CompDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "isVerified": isVerified == null ? null : isVerified,
    "remarks": remarks == null ? null : remarks,
    "compDetails": compDetails == null ? null : List<dynamic>.from(compDetails!.map((x) => x.toMap())),
  };
}

class CompDetail {
  CompDetail({
    this.jpIcompdetailId,
    this.jpIcompId,
    this.year,
    this.projectName,
    this.sanctionAmount,
    this.sponsrdAgencyGid,
    this.sponsrdAgencyName,
    this.projCompletd,
    this.sectorTrade,
    this.benefTrained,
    this.benefPlaced,
    this.officeSpaceSqft,
    this.basicFacility,
    this.tcCount,
    this.tradeHavingEquipmnt,
    this.stafOffcCount,
    this.stafTechnclCount,
    this.regCertificate,
    this.cert12A,
    this.cert80G,
    this.annualTurnover,
    this.fundState,
    this.csrFund,
    this.otherDonations,
    this.awardType,
    this.awardName,
    this.awardGivenBy,
    this.awardReceivingDate,
    this.remarks,
    this.studentEnrolled,
    this.state,
    this.address,
    this.insttitueType,
    this.insttitueName,
    this.uploadedFiles,
  });

  dynamic jpIcompdetailId;
  dynamic jpIcompId;
  dynamic year;
  dynamic projectName;
  dynamic sanctionAmount;
  dynamic sponsrdAgencyGid;
  dynamic sponsrdAgencyName;
  dynamic projCompletd;
  dynamic sectorTrade;
  dynamic benefTrained;
  dynamic benefPlaced;
  dynamic officeSpaceSqft;
  dynamic basicFacility;
  dynamic tcCount;
  dynamic tradeHavingEquipmnt;
  dynamic stafOffcCount;
  dynamic stafTechnclCount;
  String? regCertificate;
  dynamic cert12A;
  dynamic cert80G;
  dynamic annualTurnover;
  dynamic fundState;
  dynamic csrFund;
  dynamic otherDonations;
  dynamic awardType;
  dynamic awardName;
  dynamic awardGivenBy;
  dynamic awardReceivingDate;
  dynamic remarks;
  dynamic studentEnrolled;
  dynamic state;
  dynamic address;
  dynamic insttitueType;
  dynamic insttitueName;
  List<UploadedFiles>? uploadedFiles;

  factory CompDetail.fromMap(Map<String, dynamic> json) => CompDetail(
    jpIcompdetailId: json["jpIcompdetailId"],
    jpIcompId: json["jpIcompId"],
    year: json["year"],
    projectName: json["projectName"],
    sanctionAmount: json["sanctionAmount"],
    sponsrdAgencyGid: json["sponsrdAgencyGid"],
    sponsrdAgencyName: json["sponsrdAgencyName"],
    projCompletd: json["projCompletd"],
    sectorTrade: json["sectorTrade"],
    benefTrained: json["benefTrained"],
    benefPlaced: json["benefPlaced"],
    officeSpaceSqft: json["officeSpaceSqft"],
    basicFacility: json["basicFacility"],
    tcCount: json["tcCount"],
    tradeHavingEquipmnt: json["tradeHavingEquipmnt"],
    stafOffcCount: json["stafOffcCount"],
    stafTechnclCount: json["stafTechnclCount"],
    regCertificate: json["regCertificate"] == null ? null : json["regCertificate"],
    cert12A: json["cert12A"],
    cert80G: json["cert80G"],
    annualTurnover: json["annualTurnover"],
    fundState: json["fundState"],
    csrFund: json["csrFund"],
    otherDonations: json["otherDonations"],
    awardType: json["awardType"],
    awardName: json["awardName"],
    awardGivenBy: json["awardGivenBy"],
    awardReceivingDate: json["awardReceivingDate"],
    remarks: json["remarks"],
    studentEnrolled: json["studentEnrolled"],
    state: json["state"],
    address: json["address"],
    insttitueType: json["insttitueType"],
    insttitueName: json["insttitueName"],
    uploadedFiles: json["uploadedFiles"] == null ? null : List<UploadedFiles>.from(json["uploadedFiles"].map((x) => UploadedFiles.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "jpIcompdetailId": jpIcompdetailId,
    "jpIcompId": jpIcompId,
    "year": year,
    "projectName": projectName,
    "sanctionAmount": sanctionAmount,
    "sponsrdAgencyGid": sponsrdAgencyGid,
    "sponsrdAgencyName": sponsrdAgencyName,
    "projCompletd": projCompletd,
    "sectorTrade": sectorTrade,
    "benefTrained": benefTrained,
    "benefPlaced": benefPlaced,
    "officeSpaceSqft": officeSpaceSqft,
    "basicFacility": basicFacility,
    "tcCount": tcCount,
    "tradeHavingEquipmnt": tradeHavingEquipmnt,
    "stafOffcCount": stafOffcCount,
    "stafTechnclCount": stafTechnclCount,
    "regCertificate": regCertificate == null ? null : regCertificate,
    "cert12A": cert12A,
    "cert80G": cert80G,
    "annualTurnover": annualTurnover,
    "fundState": fundState,
    "csrFund": csrFund,
    "otherDonations": otherDonations,
    "awardType": awardType,
    "awardName": awardName,
    "awardGivenBy": awardGivenBy,
    "awardReceivingDate": awardReceivingDate,
    "remarks": remarks,
    "studentEnrolled": studentEnrolled,
    "state": state,
    "address": address,
    "insttitueType": insttitueType,
    "insttitueName": insttitueName,
    "uploadedFiles": uploadedFiles == null ? null : List<dynamic>.from(uploadedFiles!.map((x) => x.toMap())),
  };
}

class UploadedFiles {
  UploadedFiles({
    this.fileUpldId,
    this.moduleType,
    this.sectionType,
    this.fileText1,
    this.fileText2,
  });

  String? fileUpldId;
  String? moduleType;
  String? sectionType;
  String? fileText1;
  String? fileText2;

  factory UploadedFiles.fromMap(Map<String, dynamic> json) => UploadedFiles(
    fileUpldId: json["fileUpldId"] == null ? null : json["fileUpldId"],
    moduleType: json["moduleType"] == null ? null : json["moduleType"],
    sectionType: json["sectionType"] == null ? null : json["sectionType"],
    fileText1: json["fileText1"] == null ? null : json["fileText1"],
    fileText2: json["fileText2"] == null ? null : json["fileText2"],
  );

  Map<String, dynamic> toMap() => {
    "fileUpldId": fileUpldId == null ? null : fileUpldId,
    "moduleType": moduleType == null ? null : moduleType,
    "sectionType": sectionType == null ? null : sectionType,
    "fileText1": fileText1 == null ? null : fileText1,
    "fileText2": fileText2 == null ? null : fileText2,
  };
}
