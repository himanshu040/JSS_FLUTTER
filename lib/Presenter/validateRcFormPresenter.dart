import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jss_flutter/constants/constants.dart';
import 'package:jss_flutter/localization/languages.dart';
import 'package:jss_flutter/models/Response/ResponseValidateRcForm.dart';



import '../localization/language/language_en.dart';
import '../models/Response/ResponseError.dart';
import '../networking/ApiBaseHelper.dart';


abstract class ResponseValidateRcPresenter {
  void onResponseSuccess(ResponseValidateRcForm responseDto);
  void onError(String errorTxt);
}

class PresenterRcForm {
  ResponseValidateRcPresenter _view;

  PresenterRcForm(this._view);

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> getRcFormData(String url, BuildContext context,Map jsObject,) async {
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
          ResponseValidateRcForm responseDto = ResponseValidateRcForm.fromJson(response);
          if(responseDto.statusCode=="APP001"||responseDto.statusCode=="APP996")
          {
            _view.onResponseSuccess(responseDto);
          } else
            _view.onError(responseDto.statusDesc.toString());
          return responseDto;
        }
        else {
          ResponseErrorJ responseErrorJ = ResponseErrorJ.fromJson(response);
          _view.onError(responseErrorJ.errors[0].message);
          return;
        }
      } else {
        _view.onError(Languages.of(context)!.SOMETHING_WENT_WRONG);
        return;
      }
    } on Exception catch (_) {
      _view.onError(SOMETHING_WENT_WRONG);
      return;
    }
  }
}