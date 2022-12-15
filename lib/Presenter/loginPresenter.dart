import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jss_flutter/constants/constants.dart';
import 'package:jss_flutter/localization/languages.dart';
import 'package:jss_flutter/models/Response/ResponseLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/strings.dart';
import '../localization/language/language_en.dart';
import '../models/Response/ResponseError.dart';
import '../networking/ApiBaseHelper.dart';


abstract class ResponseLoginPresenter {
  void onResponseSuccess(ResponseLogin responseDto);
  void onError(String errorTxt);
}

class PresenterLogin {
  ResponseLoginPresenter _view;

  PresenterLogin(this._view);

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> getLogin(String url, BuildContext context,Map jsObject,) async {
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
          ResponseLogin responseDto = ResponseLogin.fromJson(response);
          if(responseDto.statusCode=="APP001")
          {
            SharedPreferences pref=await SharedPreferences.getInstance();
            pref.setString(TSNID, responseDto.transactionId.toString());
            pref.setString(PARAM11, responseDto.param11.toString());
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