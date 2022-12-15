import 'dart:convert' show utf8;
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cryptography/cryptography.dart';
import 'package:encrypt/encrypt.dart' as encrypt_package;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../components/pdfViewer.dart';


class Util {
  String SECRET_KEY = "37ZD3D89A64C115855DF9178B8R84c1x";

  String SALT = "213A26DBB4A358C5";

  String ALGO_TYPE = "PBKDF2WithHmacSHA256";
  String ENCRE_TYPE = "AES";
  String PADDING = "AES/CBC/PKCS5PADDING";
  int COUNT_ITERATION = 65536;
  int KEY_LENGTH = 256;
  static int TIMER=0;
  static int quizId=0;

  /////////////////////////////////////////

  Uint8List IVV =
      Uint8List.fromList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

  List<int> ivarray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  static String currentLocal = "en";
  static int isHeadSaved = 0;
  static int headID = 0;
  static int attemptId=0;

  encrypt_package.Encrypted encrypt(String plainText) {
    final key1 = encrypt_package.Key.fromUtf8(SECRET_KEY);
    final iv1 = encrypt_package.IV.fromUtf8(SALT);
    final encrypter = encrypt_package.Encrypter(encrypt_package.AES(key1, mode: encrypt_package.AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv1);

    return encrypted;
  }

  Future<bool> hasInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
 static String parseHtmlString(String? htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
  displayToast(String msg, BuildContext context) {
    showToast(
      msg,
      toastHorizontalMargin: 30,
      context: context,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      duration: Duration(seconds: 2),
      // alignment: Alignment.topCenter,
      position: StyledToastPosition(
        offset: 80,
        align: Alignment.bottomCenter,
      ),
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Poppins',
      ),
      backgroundColor: Colors.grey.shade800,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
 static var MONTHS = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
 static var DAYS = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];


  static String date(var timeStamp)
  {
    DateTime now = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DAYS[now.weekday-1]+" "+ now.day.toString() + " " + MONTHS[now.month - 1] + " " +
        now.year.toString() + " " + now.hour.toString() + ":" +
        now.minute.toString() + ":" + now.second.toString();
  }
  Future<File> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }
 static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename =  (url.split('/').last);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    if (kDebugMode) {
      print('$file');
    }
    return file;
  }
   void openPdf(BuildContext context, File file, String url) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PdfViewerPage(
            file: file,
            url: url,
          ),
        ),
      );
  void onPressPDF (BuildContext context,String url)async
  {
    final file = await loadPdfFromNetwork(url);
    openPdf(context, file, url);
  }
  Future<File?> pickPdfFile() async
  {
    final result= await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf']
       );
    if(result==null) {
      return null;
    }
    return File(result.paths.first.toString());
  }
}



Future<List<int>> getpkdf() async {
  final pbkdf2 = Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: 65536,
    bits: 256,
  );

  List<int> bytes = utf8.encode("37HG3D86D64C115933DF9458B8E84c1b");
  final secretKey = SecretKey(bytes);
  // A random salt
  List<int> salt = utf8.encode("913Z26EBB9F356A5");

  // Calculate a hash that can be stored in the database
  final newSecretKey = await pbkdf2.deriveKey(
    secretKey: secretKey,
    nonce: salt,
  );
  final newSecretKeyBytes = await newSecretKey.extractBytes();

  return newSecretKeyBytes;
}


