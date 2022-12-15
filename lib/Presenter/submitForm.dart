import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jss_flutter/constants/constants.dart';
import 'package:jss_flutter/localization/languages.dart';
import 'package:jss_flutter/models/Response/ResponseSubmit.dart';



import '../localization/language/language_en.dart';
import '../models/Response/ResponseError.dart';
import '../networking/ApiBaseHelper.dart';


abstract class ResponseSubmitFormPresenter {
  void onResponseSuccessSubmitForm(ResponseSubmitForm responseDto);
  void onErrorSubmitForm(String errorTxt);
}

class PresenterSubmitForm {
  ResponseSubmitFormPresenter _view;

  PresenterSubmitForm(this._view);

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic>getDetails(String url, BuildContext context,Map jsObject,) async {
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
          ResponseSubmitForm responseDto = ResponseSubmitForm.fromJson(response);
          if(responseDto.statusCode=="APP001")
          {
            _view.onResponseSuccessSubmitForm(responseDto);
          } else
            _view.onErrorSubmitForm(responseDto.statusDesc.toString());
          return responseDto;
        }
        else {
          ResponseErrorJ responseErrorJ = ResponseErrorJ.fromJson(response);
          _view.onErrorSubmitForm(responseErrorJ.errors[0].message);
          return;
        }
      } else {
        _view.onErrorSubmitForm(Languages.of(context)!.SOMETHING_WENT_WRONG);
        return;
      }
    } on Exception catch (_) {
      _view.onErrorSubmitForm(SOMETHING_WENT_WRONG);
      return;
    }
  }
}