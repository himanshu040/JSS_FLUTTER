import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/models/Response/ResponseBaseLocation.dart';
import 'package:jss_flutter/screens/Infrastructure.dart';
import 'package:jss_flutter/screens/humanResource.dart';
import 'package:jss_flutter/screens/projectTaken.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Presenter/baseLocationPresenter.dart';
import '../components/baseLocationCard.dart';
import '../constants/UrlEndPoints.dart';
import '../constants/constants.dart';
import '../constants/strings.dart';
import '../models/Request/RequestBaseLocation.dart';
import '../utility/Util.dart';
import 'Verification.dart';

class BaseLocation extends StatefulWidget {
   BaseLocation(this.darpanId,{Key? key}) : super(key: key);
   String darpanId;

  @override
  State<BaseLocation> createState() => _BaseLocationState();
}

class _BaseLocationState extends State<BaseLocation> implements ResponseBaseLocationPresenter {

 late PresenterBaseLocation presenterBaseLocation;
late ResponseBaseLocation responseBaseLocation;


  @override
  void initState()
  {
    responseBaseLocation=ResponseBaseLocation();
    presenterBaseLocation=PresenterBaseLocation(this);
    super.initState();
  }
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:  Color(0xffff8000),
        statusBarColor:  Color(0xffff8000),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return SafeArea(child:Scaffold(
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
                      Color(0xffff8000),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft
                    ,height: MediaQuery.of(context).size.height/6,
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                        AutoSizeText(
                          "Base Location",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 28
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    //height:MediaQuery.of(context).size.height/1.265,
                    width: MediaQuery.of(context).size.width,
                    padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.10,
                      left:MediaQuery.of(context).size.width*0.02,
                      right:MediaQuery.of(context).size.width*0.02,),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(50) ,
                            topRight:Radius.circular(50) )
                    ),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.66 ,
                      child: FutureBuilder<dynamic>(
                        future: getData(),
                        builder: (context, snapshot)
                        {
                          if (!snapshot.hasData) 
                          {
                            return Container(
                              height: MediaQuery.of(context).size.height*0.70,
                              width:MediaQuery.of(context).size.width,
                              child: Center(
                                child: new SizedBox(
                                  height: 50.0,
                                  width: 50.0,
                                  child: new CircularProgressIndicator(
                                    valueColor: new AlwaysStoppedAnimation<Color>(
                                        Color(0xffF49557)),
                                    strokeWidth: 1.0,
                                  ),
                                ),
                              ),
                            );
                          }
                          else
                            {
                              return responseBaseLocation.inspectionStatus!=null?
                              GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children: [
                                  GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(PageRouteBuilder(
                                      settings: RouteSettings(
                                        name: 'Verification',
                                      ),
                                      pageBuilder: (context, animation, secondaryAnimation) => Verification(widget.darpanId, responseBaseLocation.inspectionStatus!.ngoDocs!.compStatusList,"Verification of Application"),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.ease;
                                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                    ).then((value) => setState((){}));
                              },
                                      
                                      
                                      child: baseLocationCard(responseBaseLocation.inspectionStatus!.ngoDocs,context,"Verification of Application",widget.darpanId)),
                                  GestureDetector(

                                      onTap: (){
                                        Navigator.of(context).push(PageRouteBuilder(
                                          settings: RouteSettings(
                                            name: 'Infrastructure',
                                          ),
                                          pageBuilder: (context, animation, secondaryAnimation) => Infra(context,widget.darpanId),
                                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                            const begin = Offset(1.0, 0.0);
                                            const end = Offset.zero;
                                            const curve = Curves.ease;
                                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ),
                                        ).then((value) => setState((){}));
                                      },

                                      child: baseLocationCard(responseBaseLocation.inspectionStatus!.infra,context,"Infrastructure",widget.darpanId)),
                                  GestureDetector(

                                      onTap: (){
                                        Navigator.of(context).push(PageRouteBuilder(
                                          settings: RouteSettings(
                                            name: 'Human Resource',
                                          ),
                                          pageBuilder: (context, animation, secondaryAnimation) => HumanResource(),
                                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                            const begin = Offset(1.0, 0.0);
                                            const end = Offset.zero;
                                            const curve = Curves.ease;
                                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ),
                                        ).then((value) => setState((){}));
                                      },


                                      child: baseLocationCard(responseBaseLocation.inspectionStatus!.hr,context,"Human Resource",widget.darpanId)),
                                  GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(PageRouteBuilder(
                                            settings: RouteSettings(
                                              name: 'Project UnderTaken',
                                            ),
                                          pageBuilder: (context, animation, secondaryAnimation) =>   ProjectTaken(widget.darpanId, responseBaseLocation.inspectionStatus!.skill!.compStatusList,"Project Undertaken"),
                                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                            const begin = Offset(1.0, 0.0);
                                            const end = Offset.zero;
                                            const curve = Curves.ease;
                                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ),
                                        ).then((value) => setState((){}));
                                      },


                                      child: baseLocationCard(responseBaseLocation.inspectionStatus!.skill,context,"Project Undertaken",widget.darpanId)),
                                 // Visibility(
                                 //   visible: responseBaseLocation.inspectionStatus!.infra==null?false:true ,
                                 //   child: GestureDetector(
                                 //     onTap: (){
                                 //       Navigator.push(
                                 //         context,
                                 //         MaterialPageRoute(
                                 //           builder: (builder) {
                                 //             return Verification(widget.darpanId, responseBaseLocation.inspectionStatus!.infra!.compStatusList,"Infrastructure");
                                 //           },
                                 //         ),
                                 //       );
                                 //     },
                                 //     child: ClipRRect(
                                 //       child: Card(
                                 //         elevation: 5,
                                 //         child: Container(
                                 //           height: MediaQuery.of(context).size.height*0.161+MediaQuery.of(context).size.height*0.05,
                                 //           padding: EdgeInsets.all(5),
                                 //           decoration: BoxDecoration(
                                 //             borderRadius: BorderRadius.circular(5),
                                 //             color: Color(0xccffb366),
                                 //           ),
                                 //           child: Column(
                                 //             mainAxisAlignment: MainAxisAlignment.start,
                                 //             mainAxisSize: MainAxisSize.max,
                                 //             children: [
                                 //               Container(
                                 //                 height: MediaQuery.of(context).size.height*0.05,
                                 //                 child: Row(
                                 //                   mainAxisAlignment: MainAxisAlignment.end,
                                 //                   children: [
                                 //                     AutoSizeText(
                                 //                       responseBaseLocation.inspectionStatus!.infra!.status==Status.PENDING?"Pending..":"Completed ",
                                 //                       style: GoogleFonts.openSans(
                                 //                           fontWeight: FontWeight.w600
                                 //                       ),
                                 //                       textAlign: TextAlign.center,
                                 //                     ),
                                 //                    SvgPicture.asset(responseBaseLocation.inspectionStatus!.infra!.status==Status.PENDING?"images/timecard-icon.svg":"images/file-checkmark-icon.svg",height:MediaQuery.of(context).size.height*0.05,fit: BoxFit.fitHeight,)
                                 //
                                 //
                                 //                   ],
                                 //                 ),
                                 //               ),
                                 //               Container(
                                 //                 height: MediaQuery.of(context).size.height*0.161-10,
                                 //                 padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                                 //                 child: Center(
                                 //                   child: AutoSizeText(
                                 //                    "Infrastructure",
                                 //                     style: GoogleFonts.openSans(
                                 //                       fontWeight: FontWeight.bold,
                                 //                     ),
                                 //                     textAlign: TextAlign.center,
                                 //                     maxLines: 2,
                                 //                     minFontSize: 18,
                                 //                     maxFontSize: 24,
                                 //                   ),
                                 //                 ),
                                 //               )
                                 //             ],
                                 //           ),
                                 //
                                 //         ),
                                 //       ),
                                 //     ),
                                 //   ),
                                 // ),
                                 //  Visibility(
                                 //    visible: responseBaseLocation.inspectionStatus!.hr==null?false:true ,
                                 //    child: GestureDetector(
                                 //      onTap: (){
                                 //        Navigator.push(
                                 //          context,
                                 //          MaterialPageRoute(
                                 //            builder: (builder) {
                                 //              return Verification(widget.darpanId, responseBaseLocation.inspectionStatus!.hr!.compStatusList,"Human Resource");
                                 //            },
                                 //          ),
                                 //        );
                                 //      },
                                 //      child: ClipRRect(
                                 //       child: Card(
                                 //         elevation: 5,
                                 //         child: Container(
                                 //           height: MediaQuery.of(context).size.height*0.161+MediaQuery.of(context).size.height*0.05,
                                 //           padding: EdgeInsets.all(5),
                                 //           decoration: BoxDecoration(
                                 //             borderRadius: BorderRadius.circular(5),
                                 //             color: Color(0xccffb366),
                                 //           ),
                                 //           child: Column(
                                 //             mainAxisAlignment: MainAxisAlignment.start,
                                 //             mainAxisSize: MainAxisSize.max,
                                 //             children: [
                                 //               Container(
                                 //                 height: MediaQuery.of(context).size.height*0.05,
                                 //                 child: Row(
                                 //                   mainAxisAlignment: MainAxisAlignment.end,
                                 //                   children: [
                                 //                     AutoSizeText(
                                 //                       responseBaseLocation.inspectionStatus!.hr!.status==Status.PENDING?"Pending..":"Completed ",
                                 //                       style: GoogleFonts.openSans(
                                 //                           fontWeight: FontWeight.w600
                                 //                       ),
                                 //                       textAlign: TextAlign.center,
                                 //                     ),
                                 //                    SvgPicture.asset(responseBaseLocation.inspectionStatus!.hr!.status==Status.PENDING?"images/timecard-icon.svg":"images/file-checkmark-icon.svg",height:MediaQuery.of(context).size.height*0.05,fit: BoxFit.fitHeight,)
                                 //
                                 //
                                 //                   ],
                                 //                 ),
                                 //               ),
                                 //               Container(
                                 //                 height: MediaQuery.of(context).size.height*0.161-10,
                                 //                 padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                                 //                 child: Center(
                                 //                   child: AutoSizeText(
                                 //                    "Human Resource",
                                 //                     style: GoogleFonts.openSans(
                                 //                       fontWeight: FontWeight.bold,
                                 //                     ),
                                 //                     minFontSize: 18,
                                 //                     maxFontSize: 24,
                                 //                     textAlign: TextAlign.center,
                                 //                     maxLines: 2,
                                 //                   ),
                                 //                 ),
                                 //               )
                                 //             ],
                                 //           ),
                                 //
                                 //         ),
                                 //       ),
                                 // ),
                                 //    ),
                                 //  ),
                                 //  Visibility(
                                 //    visible: responseBaseLocation.inspectionStatus!.skill==null?false:true ,
                                 //    child: GestureDetector(
                                 //      onTap: (){
                                 //        Navigator.push(
                                 //          context,
                                 //          MaterialPageRoute(
                                 //            builder: (builder) {
                                 //              return Verification(widget.darpanId, responseBaseLocation.inspectionStatus!.skill!.compStatusList,"Project Undertaken");
                                 //            },
                                 //          ),
                                 //        );
                                 //      },
                                 //      child: ClipRRect(
                                 //       child: Card(
                                 //         elevation: 5,
                                 //         child: Container(
                                 //           height: MediaQuery.of(context).size.height*0.161+MediaQuery.of(context).size.height*0.05,
                                 //           padding: EdgeInsets.all(5),
                                 //           decoration: BoxDecoration(
                                 //             borderRadius: BorderRadius.circular(5),
                                 //             color: Color(0xccffb366),
                                 //           ),
                                 //           child: Column(
                                 //             mainAxisAlignment: MainAxisAlignment.start,
                                 //             mainAxisSize: MainAxisSize.max,
                                 //             children: [
                                 //               Container(
                                 //                 height: MediaQuery.of(context).size.height*0.05,
                                 //                 child: Row(
                                 //                   mainAxisAlignment: MainAxisAlignment.end,
                                 //                   children: [
                                 //                     AutoSizeText(
                                 //                       responseBaseLocation.inspectionStatus!.skill!.status==Status.PENDING?"Pending..":"Completed ",
                                 //                       style: GoogleFonts.openSans(
                                 //                           fontWeight: FontWeight.w600
                                 //                       ),
                                 //                       textAlign: TextAlign.center,
                                 //                     ),
                                 //                    SvgPicture.asset(responseBaseLocation.inspectionStatus!.skill!.status==Status.PENDING?"images/timecard-icon.svg":"images/file-checkmark-icon.svg",height:MediaQuery.of(context).size.height*0.05,fit: BoxFit.fitHeight,)
                                 //
                                 //
                                 //                   ],
                                 //                 ),
                                 //               ),
                                 //               Container(
                                 //                 height: MediaQuery.of(context).size.height*0.161-10,
                                 //                 padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                                 //                 child: Center(
                                 //                   child: AutoSizeText(
                                 //                    "Project Undertaken",
                                 //                     style: GoogleFonts.openSans(
                                 //                       fontWeight: FontWeight.bold,
                                 //                     ),
                                 //                     textAlign: TextAlign.center,
                                 //                     maxLines: 2,
                                 //                     minFontSize: 18,
                                 //                     maxFontSize: 24,
                                 //                   ),
                                 //                 ),
                                 //               )
                                 //             ],
                                 //           ),
                                 //
                                 //         ),
                                 //       ),
                                 // ),
                                 //    ),
                                 //  ),

                                ],
                              ):
                              Center(
                                child: Text(
                                  "NO DATA FOUND"
                                ),
                              );
                            }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

 Future<dynamic> getData ()async
 {

   String url=BASE_URL+VIEW_INSPECTION;
   SharedPreferences preferences=await SharedPreferences.getInstance();
   String? transactionId=preferences.getString(TSNID);
   String? param11=preferences.getString(PARAM11);
   RequestBaseLocation requestDetails=RequestBaseLocation(transactionId: transactionId,param11:int.parse(param11.toString()), source: source, param15:widget.darpanId, param13: "BASE");
   Util util = Util();
   bool isOnline = await util.hasInternet();
   if (isOnline) {
     return presenterBaseLocation.getBaseLocation(url, context,requestDetails.toMap());
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
  void onResponseSuccess(ResponseBaseLocation responseDto) {
    // TODO: implement onResponseSuccess
    responseBaseLocation=responseDto;
    return;
  }
}
