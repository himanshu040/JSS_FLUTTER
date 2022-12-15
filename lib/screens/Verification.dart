import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/models/Response/ResponseBaseLocation.dart';


import 'ValidateForm.dart';


class Verification extends StatefulWidget {
  Verification(this.darpanId,this.compStatusList,this.heading,{Key? key}) : super(key: key);
  String darpanId;
  List<CompStatusList>? compStatusList;
  String heading;

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification>  {



  @override
  void initState()
  {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    height: MediaQuery.of(context).size.height/6,
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
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
                        Padding(
                          padding:  EdgeInsets.only(left:25.0),
                          child: AutoSizeText(
                           widget.heading,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18
                            ),
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
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.66 ,
                      child: widget.compStatusList!.isNotEmpty?GridView.builder(
                        itemCount: widget.compStatusList!.length,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder:  (context, index) {
                            return   GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => ValidateRcForm(widget.darpanId, widget.compStatusList![index]!.component,widget.heading,gettitle(widget.compStatusList![index].component.toString()),),
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
                              child: ClipRRect(
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.161+MediaQuery.of(context).size.height*0.05,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xccffb366),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height*0.05,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              AutoSizeText(
                                               widget.compStatusList![index].status.toString().toUpperCase()=="PENDING"?"Pending..":"Completed ",
                                                style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                  color: widget.compStatusList![index].status.toString().toUpperCase()=="PENDING"?Colors.red:Colors.green
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SvgPicture.asset(widget.compStatusList![index].status.toString().toUpperCase()=="PENDING"?"images/timecard-icon.svg":"images/file-checkmark-icon.svg",height:MediaQuery.of(context).size.height*0.05,fit: BoxFit.fitHeight,)


                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context).size.height*0.138,
                                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                                          child: Center(
                                            child: AutoSizeText(
                                              gettitle(widget.compStatusList![index].component.toString()),
                                              style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 3,
                                              minFontSize: 16,
                                              maxFontSize: 24,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            );
                          },):
                      Center(
                        child: Text(
                            "NO DATA FOUND"
                        ),
                      )

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

  String gettitle(String text)
  {
    switch(text)
    {
      case "RC":return "Validate Registration Certificate";
      case "12A80G":return "Valid 12 A & 80 G Certificate";
      case "SKILL":return "Skill Training & Placement Data";
      case "COMMUNITY":return "Projects other than Skill Training";
      case "INSTITUTE":return "Institution run by the Agency";
      case "AUDIT":return "CA Certificate along with Audit Reports";
      case "AWARD":return "Awards/Rewards";
      case "INFRA":return "Office Space Details";
      case "OTHER_PROJECT":return "Other than skill training";
      case "PROJECT":return "Skill training";

      default:return "Other";
    }
  }

}
