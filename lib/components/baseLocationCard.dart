import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/models/Response/ResponseBaseLocation.dart';


Widget baseLocationCard(NgoDocs? inspectionStatus,BuildContext context,String title,String darpanId)
{

  return inspectionStatus!=null?
  Visibility(
    visible: inspectionStatus==null?false:true ,
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
                      inspectionStatus!.status=="COMPLETED"?"Completed":"Pending..",
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                        color: inspectionStatus!.status=="COMPLETED"?Colors.green:Colors.red
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SvgPicture.asset(inspectionStatus!.status=="COMPLETED"?"images/file-checkmark-icon.svg":"images/timecard-icon.svg",height:MediaQuery.of(context).size.height*0.05,fit: BoxFit.fitHeight,)

                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.138,
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
                child: Center(
                  child: AutoSizeText(
                    title,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    minFontSize: 18,
                    maxFontSize: 24,
                  ),
                ),
              )
            ],
          ),

        ),
      ),
    ),
  ):
  ClipRRect(
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
                   "Pending..",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SvgPicture.asset("images/timecard-icon.svg",height:MediaQuery.of(context).size.height*0.05,fit: BoxFit.fitHeight,)

                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.148,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
              child: Center(
                child: AutoSizeText(
                  title,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  minFontSize: 18,
                  maxFontSize: 24,
                ),
              ),
            )
          ],
        ),

      ),
    ),
  );
}