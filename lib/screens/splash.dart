
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jss_flutter/constants/constants.dart';
import 'package:jss_flutter/screens/dashboard/dashboard.dart';
import 'package:jss_flutter/screens/login.dart';
import 'package:jss_flutter/utility/Util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/Strings.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late String version;
  final int splashDuration = 4;

  startTime() async {
    return Timer(Duration(seconds: splashDuration), () async {
      _navigatetohome();
    });
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 00), () {});

    SharedPreferences perf = await SharedPreferences.getInstance();
    String? login = perf.getString(LOGIN) ?? "false";
    Util util = Util();
    bool isOnline = await util.hasInternet();
    if (isOnline || !isOnline) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      Fluttertoast.showToast(
          msg: "No Internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.black,
          backgroundColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: kFillaSurveyColor,
        statusBarColor: kFillaSurveyColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/splash_bg.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          // constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }
}
