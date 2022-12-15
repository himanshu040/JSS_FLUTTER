import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/Presenter/validateRcFormPresenter.dart';
import 'package:jss_flutter/components/OtherProjectForm.dart';
import 'package:jss_flutter/components/skillprojectform.dart';
import 'package:jss_flutter/constants/UrlEndPoints.dart';
import 'package:jss_flutter/constants/constants.dart';
import 'package:jss_flutter/models/Request/RequestValidateForm.dart';
import 'package:jss_flutter/models/Response/ResponseBaseLocation.dart';
import 'package:jss_flutter/models/Response/ResponseValidateRcForm.dart';
import 'package:jss_flutter/utility/Util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/strings.dart';

class OtherThanSkill extends StatefulWidget {
   OtherThanSkill(this.darpanId,this.component,this.heading,this.title,{Key? key}) : super(key: key);
   String darpanId;
   String? component;
   String heading;
   String title;

   @override
  State<OtherThanSkill> createState() => _OtherThanSkillState();
}

class _OtherThanSkillState extends State<OtherThanSkill> implements ResponseValidateRcPresenter {
  late PresenterRcForm presenterRcForm;
  late ResponseValidateRcForm responseValidateRcForm;
  @override
  void initState()
  {
    responseValidateRcForm=ResponseValidateRcForm();
    presenterRcForm=PresenterRcForm(this);
    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
      body:Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xffff8000),
                      Color(0xffFFFFFF)
                    ]
                )
            ) ,

          ),
          GestureDetector(
            onTap: () { FocusManager.instance.primaryFocus?.unfocus();

            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height/6,
                    padding: EdgeInsets.only(top:MediaQuery.of(context).size.width*0.05,
                        left:MediaQuery.of(context).size.width*0.05,
                        right:MediaQuery.of(context).size.width*0.05 ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: const Icon(Icons.arrow_back_ios,color: Colors.white,))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Base Location",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 28
                              ),
                            ),
                            AutoSizeText(
                              widget.heading,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          width: MediaQuery.of(context).size.width*0.30,

                        )

                      ],
                    ),
                  ),
                  Container(
                      height:MediaQuery.of(context).size.height*0.79,
                      width: MediaQuery.of(context).size.width,
                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03,
                        left:MediaQuery.of(context).size.width*0.02,
                        right:MediaQuery.of(context).size.width*0.02,),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(50) ,
                              topRight:Radius.circular(50) )
                      ),
                      child:Container(
                          height: MediaQuery.of(context).size.height*0.70,
                          color: Colors.transparent,
                          child:Column(
                            mainAxisAlignment:MainAxisAlignment.start ,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(widget.title,
                                  style: GoogleFonts.openSans(
                                      color: const Color(0xffff8000),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              const SizedBox(height: 10,),
                              FutureBuilder<dynamic>(
                                  future: getData(),
                                  builder: (context, snapshot){
                                    if (!snapshot.hasData)
                                    {
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height*0.70-50,
                                        width:MediaQuery.of(context).size.width,
                                        child: const Center(
                                          child: SizedBox(
                                            height: 50.0,
                                            width: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                  Color(0xffF49557)),
                                              strokeWidth: 1.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                   else {
                                     if(responseValidateRcForm.component==null)
                                     {
                                       return  Padding(
                                         padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.20),
                                         child:  Center(
                                           child: Text(
                                             "NO DATA FOUND",
                                             style: GoogleFonts.openSans(),
                                           ),
                                         ),
                                       );
                                     }
                                     else
                                     {
                                       return Container(
                                         height:  MediaQuery.of(context).size.height*0.64,
                                       );
                                     }
                                    }

                                    }
                                    ),

                            ],
                          )
                      )

                  )
                ],
              ),
            ),
          ),

        ],
      ) ,
          floatingActionButton:  GestureDetector(
            onTap: (){
              Navigator.of(context).push(_createRoute()).then((value) => setState((){}));
            },
            child: SvgPicture.asset("images/add new record.svg",height:MediaQuery.of(context).size.height*0.10,fit: BoxFit.fitHeight,),
          ),
    ));
  }
  Route _createRoute() {

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>widget.component=="PROJECT"?SkillProjectForm():OtherProjectForm(widget.darpanId),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<dynamic> getData ()async
  {

    String url=BASE_URL+VALIDATE_FORM;
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String? transactionId=preferences.getString(TSNID);
    String? param11=preferences.getString(PARAM11);
    RequestValidateRcForm requestDetails=RequestValidateRcForm(transactionId: transactionId,param11:int.parse(param11.toString()), source: source, param15:widget.darpanId, param13: "BASE",param12: widget.component);
    Util util = Util();
    bool isOnline = await util.hasInternet();
    if (isOnline) {
      return presenterRcForm.getRcFormData(url, context,requestDetails.toMap());
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
  void onResponseSuccess(ResponseValidateRcForm responseDto) {
    // TODO: implement onResponseSuccess
    responseValidateRcForm=responseDto;
    // if(responseDto.statusCode!="APP001") {
    //   Fluttertoast.showToast(
    //     msg: responseDto!.statusDesc.toString(),
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     textColor: Colors.white,
    //     backgroundColor: Colors.black,
    //     fontSize: 16.0);
    // }
    return;
  }
}
