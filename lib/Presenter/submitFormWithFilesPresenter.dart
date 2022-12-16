import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jss_flutter/constants/constants.dart';
import 'package:jss_flutter/localization/languages.dart';
import 'package:jss_flutter/models/Response/ResponseFileUpload.dart';
import '../localization/language/language_en.dart';
import '../models/Response/ResponseError.dart';
import '../networking/ApiBaseHelper.dart';


abstract class ResponseSubmitFormsWithFilesPresenter {
  bool onResponseUploadFile(ResponseFileUpload responseDto,String section,String text1,String text2);
  bool onErrorUploadFile(String errorTxt);
}

class PresenterSubmitFormWithFiles {
  ResponseSubmitFormsWithFilesPresenter _view;

  PresenterSubmitFormWithFiles(this._view);

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<bool>uploadFile(String url, BuildContext context,Map jsObject,String section,String text1,String text2) async {
    try {
      String username=userNameAuth;
      String password=passwordAuth;
      String basicAuth="Basic "+base64.encode(utf8.encode('$username:$password'));
      DateTime time = DateTime.now();
      String timestamp=time.millisecondsSinceEpoch.toString();
      final Map<String, dynamic> response =
      await _helper.postWithBarear(url,jsObject,basicAuth,timestamp);

      if (response != null) {
        if (!response.containsKey("errors")) {
          ResponseFileUpload responseDto = ResponseFileUpload.fromJson(response);
          if(responseDto.statusCode=="APP001")
          {
          bool success=  _view.onResponseUploadFile(responseDto,section,text1,text2);
           return success;
          } else {
            _view.onErrorUploadFile(responseDto.statusDesc.toString());
            return false;
          }
        }
        else {
          ResponseErrorJ responseErrorJ = ResponseErrorJ.fromJson(response);
          _view.onErrorUploadFile(responseErrorJ.errors[0].message);
          return false;
        }
      } else {
        _view.onErrorUploadFile(Languages.of(context)!.SOMETHING_WENT_WRONG);
        return false;
      }
    } on Exception catch (_) {
      _view.onErrorUploadFile(SOMETHING_WENT_WRONG);
      return false;
    }
  }
}