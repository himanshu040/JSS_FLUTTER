import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Class_List_component extends StatelessWidget {
  Class_List_component({
    required this.colour,
    required this.text,
    required this.classval,
  });

  final Color colour;
  final int classval;

  //final Future<void> onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => onPress,
      child: Container(
        height: 50,
        width: MediaQuery
            .of(context)
            .size
            .width - 32,
        //margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          //width: 80,
          margin: EdgeInsets.only(left: 10),
          child: Text(
            text,
            textAlign: TextAlign.center,
            softWrap: true,
            style: GoogleFonts.openSans(
                fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}