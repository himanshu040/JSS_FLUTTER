import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:jss_flutter/Presenter/loginPresenter.dart';
import 'package:jss_flutter/constants/Strings.dart';
import 'package:jss_flutter/constants/UrlEndPoints.dart';
import 'package:jss_flutter/models/Request/RequestLogin.dart';
import 'package:jss_flutter/models/Response/ResponseLogin.dart';
import 'package:jss_flutter/screens/dashboard/dashboard.dart';
import 'package:jss_flutter/utility/Util.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> implements ResponseLoginPresenter{

  late TextEditingController userid;
  late TextEditingController password;
  bool _passwordVisible=false;
  late PresenterLogin presenterLogin;
  bool isloader=false;
  late RequestLogin requestLogin;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:  Color(0xffEF8B9E),
        statusBarColor:  Color(0xffEF8B9E),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    super.initState();
    // _loadUserEmailPassword();
    presenterLogin=PresenterLogin(this);
    requestLogin=new RequestLogin();
    userid= TextEditingController(text:"manishva");
    password= TextEditingController(text:"test@123#");
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration:BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xffEF8B9E),
                        Color(0xffFFFFFF)
                      ]
                  )
              ) ,

            ),
            GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: MediaQuery.of(context).size.height/4,
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 28
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  AutoSizeText(
                                    "Please login to continue",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child:Container(
                                  alignment: Alignment.bottomRight,
                                  child:Image.asset("images/assessor.png") ,
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height- MediaQuery.of(context).size.height/3,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(50) ,topRight:Radius.circular(50) )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Officer Login",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffEF8B9E),
                                  fontSize: 24
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                TextFormField(
                                  autofocus: false,
                                  controller: userid,
                                  style:  GoogleFonts.openSans(
                                      fontSize: 20
                                  ),
                                  cursorColor: Color(0xffDFDFDF),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusColor: null,
                                    contentPadding: EdgeInsets.only(bottom: 10,top: 10),
                                    prefixIcon:Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                        'images/ic_user_id.PNG',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    labelText: "User Id",
                                    labelStyle: GoogleFonts.openSans(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                    focusedBorder:UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Color(0xffDFDFDF),
                                          width: 1,
                                        )
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Color(0xffDFDFDF),
                                          width: 1,
                                        )
                                    ),

                                  ),


                                ),
                                SizedBox(height: 20,),
                                TextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  autofocus: false,
                                  controller: password,
                                  style:  GoogleFonts.openSans(
                                      fontSize: 20,
                                      decoration: TextDecoration.none
                                  ),
                                  obscureText: !_passwordVisible,
                                  cursorColor: Color(0xffDFDFDF),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusColor: null,
                                    suffixIcon: Container(
                                      width: MediaQuery.of(context).size.width*0.20,
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "FORGOT",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            color: Color(0xffF5A32D),
                                            decoration: TextDecoration.none
                                        ),
                                      ),
                                    ) ,
                                    prefixIcon:Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                        'images/ic_password.PNG',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    labelText: "Password",
                                    labelStyle: GoogleFonts.openSans(
                                        fontSize: 20,
                                        color: Colors.black
                                    ),
                                    focusedBorder:UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Color(0xffDFDFDF),
                                          width: 1,
                                        )
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Color(0xffDFDFDF),
                                          width: 1,
                                        )
                                    ),
                                  ),


                                ),
                                SizedBox(height: 20,),
                                GestureDetector(
                                  onTap: () async{
                                    getData();
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      width: MediaQuery.of(context).size.width/2.5,
                                      height: 50,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            Icon(Icons.arrow_forward_outlined,color: Colors.white,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // ElevatedButton(onPressed:(){
            //   getData();
            // } , child: Text(
            //   "login"
            // ))


          ],
        ),

      ),
    );
  }

  Future<void> getData ()async
  {
    loader();

    String url=BASE_URL+LOG_IN;
    //  UserPojo user=new UserPojo(loginId:userid.text.toString(),password: password.text.toString(),userType: 5 );
    UserPojo user=new UserPojo(loginId:"SD/pOuJd9Ssxpzdk2vskUA==",password: "di0MCDAQSGTVa5Fnwo3J5g==",userType: 5 );
    requestLogin=RequestLogin(userPojo:user,source:"aenc",transactionId:"1234" );

    Util util = new Util();
    bool isOnline = await util.hasInternet();

    if (isOnline) {
      return presenterLogin.getLogin(url, context,requestLogin.toMap());
    }
    else {

      Fluttertoast.showToast(
          msg: "No Internet!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          backgroundColor: Colors.black,
          fontSize: 16.0);
      return ;
    }

  }
  Future<dynamic>? loader() {
    isloader = true;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            strokeWidth: 5.0,
          ),
        ),
      ),
    );
  }
  void setLogin() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    perf.setString(LOGIN, "true");
    //  String? onboarding = perf.getString(ONBOARDING);
  }

  @override
  void onError(String errorTxt) {
    // TODO: implement onError
    Navigator.pop(context);
    Fluttertoast.showToast(
        msg: errorTxt,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.black,
        fontSize: 16.0);
  }

  @override
  void onResponseSuccess(ResponseLogin responseDto) {
    Navigator.pop(context);
    // TODO: implement onResponseSuccess
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Dashboard()));
  }

}
