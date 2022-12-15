import 'dart:convert';

RequestFileUpload requestFileUploadFromMap(String str) => RequestFileUpload.fromMap(json.decode(str));

String requestFileUploadToMap(RequestFileUpload data) => json.encode(data.toMap());

class RequestFileUpload {
  RequestFileUpload({
    this.fileUpload,
    this.source,
    this.transactionId,
    this.param11,
    this.param15,
    this.param13,
  });

  FileUpload? fileUpload;
  String? source;
  String? transactionId;
  int? param11;
  String? param15;
  String? param13;

  factory RequestFileUpload.fromMap(Map<String, dynamic> json) => RequestFileUpload(
    fileUpload: json["fileUpload"] == null ? null : FileUpload.fromMap(json["fileUpload"]),
    source: json["source"] == null ? null : json["source"],
    transactionId: json["transactionId"] == null ? null : json["transactionId"],
    param11: json["param11"] == null ? null : json["param11"],
    param15: json["param15"] == null ? null : json["param15"],
    param13: json["param13"] == null ? null : json["param13"],
  );

  Map<String, dynamic> toMap() => {
    "fileUpload": fileUpload == null ? null : fileUpload!.toMap(),
    "source": source == null ? null : source,
    "transactionId": transactionId == null ? null : transactionId,
    "param11": param11 == null ? null : param11,
    "param15": param15 == null ? null : param15,
    "param13": param13 == null ? null : param13,
  };
}

class FileUpload {
  FileUpload({
    this.moduleType,
    this.sectionType,
    this.contentType,
    this.filename,
    this.file,
    this.fileText1,
    this.fileText2,
  });

  String? moduleType;
  String? sectionType;
  String? contentType;
  String? filename;
  List<int>? file;
  String? fileText1;
  String? fileText2;

  factory FileUpload.fromMap(Map<String, dynamic> json) => FileUpload(
    moduleType: json["moduleType"] == null ? null : json["moduleType"],
    sectionType: json["sectionType"] == null ? null : json["sectionType"],
    contentType: json["contentType"] == null ? null : json["contentType"],
    filename: json["filename"] == null ? null : json["filename"],
    file: json["file"] == null ? null : List<int>.from(json["file"].map((x) => x)),
    fileText1: json["fileText1"] == null ? null : json["fileText1"],
    fileText2: json["fileText2"] == null ? null : json["fileText2"],
  );

  Map<String, dynamic> toMap() => {
    "moduleType": moduleType == null ? null : moduleType,
    "sectionType": sectionType == null ? null : sectionType,
    "contentType": contentType == null ? null : contentType,
    "filename": filename == null ? null : filename,
    "file": file == null ? null : List<dynamic>.from(file!.map((x) => x)),
    "fileText1": fileText1 == null ? null : fileText1,
    "fileText2": fileText2 == null ? null : fileText2,
  };
}
