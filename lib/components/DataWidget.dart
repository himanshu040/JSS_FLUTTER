import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget data(String s1,String s2)
{
  return Visibility(
    // visible: s2==""||s2=="null"?false:true,
    visible: true,
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            s1,
            style: GoogleFonts.openSans(
                color: Colors.grey),
            maxFontSize: 12,
            minFontSize: 10,
          ),
          AutoSizeText(
            s2=="null"?"-":s2,
            style: GoogleFonts.openSans(
                fontWeight:
                FontWeight.w600),
            maxFontSize: 12,
            minFontSize: 10,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}