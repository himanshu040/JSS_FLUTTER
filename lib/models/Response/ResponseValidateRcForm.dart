// To parse this JSON data, do
//
//     final responseValidateRcForm = responseValidateRcFormFromJson(jsonString);

import 'dart:convert';

ResponseValidateRcForm responseValidateRcFormFromJson(String str) => ResponseValidateRcForm.fromJson(json.decode(str));

String responseValidateRcFormToJson(ResponseValidateRcForm data) => json.encode(data.toJson());

class ResponseValidateRcForm {
  ResponseValidateRcForm({
    this.statusCode,
    this.statusDesc,
    this.transactionId,
    this.component,
  });

  String? statusCode;
  String? statusDesc;
  String? transactionId;
  Component? component;

  factory ResponseValidateRcForm.fromJson(Map<String, dynamic> json) => ResponseValidateRcForm(
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    statusDesc: json["statusDesc"] == null ? null : json["statusDesc"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    component: json["component"] == null ? null : Component.fromJson(json["component"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "statusDesc": statusDesc == null ? null : statusDesc,
    "transactionId": transactionId == null ? null : transactionId,
    "component": component == null ? null : component!.toJson(),
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

  factory Component.fromJson(Map<String, dynamic> json) => Component(
    isVerified: json["isVerified"] == null ? null : json["isVerified"],
    remarks: json["remarks"] == null ? null : json["remarks"],
    compDetails: json["compDetails"] == null ? null : List<CompDetail>.from(json["compDetails"].map((x) => CompDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isVerified": isVerified == null ? null : isVerified,
    "remarks": remarks == null ? null : remarks,
    "compDetails": compDetails == null ? null : List<dynamic>.from(compDetails!.map((x) => x.toJson())),
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
    this.status,
    this.createdDate,
    this.uploadedFiles,
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
  dynamic status;
  dynamic createdDate;
  List<UploadedFile> ?uploadedFiles;
  String ?regCertificate;
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
  Address? address;
  dynamic insttitueType;
  dynamic insttitueName;

  factory CompDetail.fromJson(Map<String, dynamic> json) => CompDetail(
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
    status: json["status"],
    createdDate: json["createdDate"],
    uploadedFiles: json["uploadedFiles"] == null ? null : List<UploadedFile>.from(json["uploadedFiles"].map((x) => UploadedFile.fromJson(x))),
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
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    insttitueType: json["insttitueType"],
    insttitueName: json["insttitueName"],
  );

  Map<String, dynamic> toJson() => {
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
    "status": status,
    "createdDate": createdDate,
    "uploadedFiles": uploadedFiles == null ? null : List<dynamic>.from(uploadedFiles!.map((x) => x.toJson())),
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
    "address": address == null ? null : address!.toJson(),
    "insttitueType": insttitueType,
    "insttitueName": insttitueName,
  };

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
    status: json["status"],
    createdDate: json["createdDate"],
    uploadedFiles: json["uploadedFiles"] == null ? null : List<UploadedFile>.from(json["uploadedFiles"].map((x) => UploadedFile.fromMap(x))),
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
    insttitueName: json["insttitueName"],
    insttitueType: json["insttitueType"],
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
    "status": status,
    "createdDate": createdDate,
    "uploadedFiles": uploadedFiles == null ? null : List<dynamic>.from(uploadedFiles!.map((x) => x.toMap())),
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
    "address": address == null ? null : address!.toMap(),
    "insttitueName": insttitueName,
    "insttitueType": insttitueType,
  };

}

class UploadedFile {
  UploadedFile({
    this.moduleType,
    this.sectionType,
    this.contentType,
    this.filename,
    this.file,
    this.loginUsrId,
    this.fileParentId,
    this.fileParentTablenm,
    this.fileText1,
    this.fileText2,
    this.fileUrl,
  });

  String? moduleType;
  String? sectionType;
  dynamic contentType;
  String? filename;
  dynamic file;
  dynamic loginUsrId;
  dynamic fileParentId;
  dynamic fileParentTablenm;
  dynamic fileText1;
  dynamic fileText2;
  String? fileUrl;

  factory UploadedFile.fromJson(Map<String, dynamic> json) => UploadedFile(
    moduleType: json["moduleType"] == null ? null : json["moduleType"],
    sectionType: json["sectionType"] == null ? null : json["sectionType"],
    contentType: json["contentType"],
    filename: json["filename"] == null ? null : json["filename"],
    file: json["file"],
    loginUsrId: json["loginUsrId"],
    fileParentId: json["fileParentId"],
    fileParentTablenm: json["fileParentTablenm"],
    fileText1: json["fileText1"],
    fileText2: json["fileText2"],
    fileUrl: json["fileUrl"] == null ? null : json["fileUrl"],
  );

  Map<String, dynamic> toJson() => {
    "moduleType": moduleType == null ? null : moduleType,
    "sectionType": sectionType == null ? null : sectionType,
    "contentType": contentType,
    "filename": filename == null ? null : filename,
    "file": file,
    "loginUsrId": loginUsrId,
    "fileParentId": fileParentId,
    "fileParentTablenm": fileParentTablenm,
    "fileText1": fileText1,
    "fileText2": fileText2,
    "fileUrl": fileUrl == null ? null : fileUrl,
  };
  factory UploadedFile.fromMap(Map<String, dynamic> json) => UploadedFile(
    moduleType: json["moduleType"] == null ? null : json["moduleType"],
    sectionType: json["sectionType"] == null ? null : json["sectionType"],
    contentType: json["contentType"],
    filename: json["filename"] == null ? null : json["filename"],
    file: json["file"],
    loginUsrId: json["loginUsrId"],
    fileParentId: json["fileParentId"],
    fileParentTablenm: json["fileParentTablenm"],
    fileText1: json["fileText1"],
    fileText2: json["fileText2"],
    fileUrl: json["fileUrl"] == null ? null : json["fileUrl"],
  );

  Map<String, dynamic> toMap() => {
    "moduleType": moduleType == null ? null : moduleType,
    "sectionType": sectionType == null ? null : sectionType,
    "contentType": contentType,
    "filename": filename == null ? null : filename,
    "file": file,
    "loginUsrId": loginUsrId,
    "fileParentId": fileParentId,
    "fileParentTablenm": fileParentTablenm,
    "fileText1": fileText1,
    "fileText2": fileText2,
    "fileUrl": fileUrl == null ? null : fileUrl,
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

}

