import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/components/custom_dropdown.dart';
import 'package:jss_flutter/utility/Util.dart';

class SkillProjectForm extends StatefulWidget {
   SkillProjectForm({Key? key}) : super(key: key);

  @override
  State<SkillProjectForm> createState() => _SkillProjectFormState();
}

class _SkillProjectFormState extends State<SkillProjectForm> {
  File? filepath;
  String? filename;
  List<String> fundedBy=["Central Government",
    "State Government",
    "Local Bodies ( Nigam, Mission, Corporation)",
    "CSR",
    "FCRA"];
  List<String> statusOfprogramm=["Completed",
    "Ongoing"];
  List<int> fundedByGid=[205  ,
    206  ,
    207 ,
    208 ,
    347 ];
  int fundedindex=-1;
  int statusOfprogrammindex=-1;
  int? fundedByGidValue;
  String? fundedByvalue;
  String? statusOfprogrammValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,
                decoration:const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color(0xffff8000),
                          Color(0xffFFFFFF)
                        ]
                    )
                ) ,

              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height:MediaQuery.of(context).size.height*0.90,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50) ,bottomRight:Radius.circular(50) )
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.04,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:  AutoSizeText(
                          "Project Details",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              fontSize: 24
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.04,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText("Year",
                              style: GoogleFonts.openSans(
                                  fontSize: 16
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width*0.30,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.orange,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16
                                  ),

                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AutoSizeText("Name of Project/Programme",
                                style: GoogleFonts.openSans(
                                    fontSize: 16
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width*0.30,
                                child: TextFormField(
                                  minLines: 1, // any number you need (It works as the rows for the textarea)
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 6,
                                  cursorColor: Colors.orange,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16
                                  ),

                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(5),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),
                    SliverToBoxAdapter(
                        child: Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText("Funded by",
                                  style: GoogleFonts.openSans(
                                      fontSize: 16
                                  ),
                                ),
                                CustomDropdownButton(
                                  hint: 'Select',
                                  dropdownItems: fundedBy,
                                  buttonWidth: MediaQuery.of(context).size.width*0.40,
                                  buttonHeight: MediaQuery.of(context).size.height*0.05,
                                  dropdownWidth:MediaQuery.of(context).size.width*0.40,
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                      border: Border.all(color: Color(0xffAFA6A6)
                                      )
                                  ),
                                  value:fundedindex==-1?null: fundedBy[fundedindex],
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      fundedByvalue = value;
                                      fundedindex=fundedBy.indexOf(value);
                                      fundedByGidValue=fundedByGid[fundedindex];
                                      print("funded value gid==$fundedByGidValue");
                                    });
                                  },
                                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                                  iconSize: 30,
                                ),
                              ],
                            )
                        )
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.04,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText("Amount Sanctioned",
                              style: GoogleFonts.openSans(
                                  fontSize: 16
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width*0.30,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.orange,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16
                                  ),
                                  textAlign: TextAlign.center,

                                  decoration: InputDecoration(
                                    suffixText: "₹",
                                    contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.04,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AutoSizeText("Trained",
                                style: GoogleFonts.openSans(
                                    fontSize: 16
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width*0.30,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.orange,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16
                                  ),
                                  textAlign: TextAlign.center,

                                  decoration: InputDecoration(
                                    suffixText: "₹",
                                    contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.04,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AutoSizeText("Placed",
                                style: GoogleFonts.openSans(
                                    fontSize: 16
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width*0.30,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  cursorColor: Colors.orange,
                                  style: GoogleFonts.openSans(
                                      fontSize: 16
                                  ),
                                  textAlign: TextAlign.center,

                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                        borderSide: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                        )
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),
                    SliverToBoxAdapter(
                        child: Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AutoSizeText("Status of Programme",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                CustomDropdownButton(
                                  hint: 'Select',
                                  dropdownItems: statusOfprogramm,
                                  buttonWidth: MediaQuery.of(context).size.width*0.40,
                                  buttonHeight: MediaQuery.of(context).size.height*0.05,
                                  dropdownWidth:MediaQuery.of(context).size.width*0.40,
                                  buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                      border: Border.all(color: Color(0xffAFA6A6)
                                      )
                                  ),
                                  value:statusOfprogrammindex==-1?null: statusOfprogramm[statusOfprogrammindex],
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      statusOfprogrammValue = value;
                                      statusOfprogrammindex=statusOfprogramm.indexOf(value);
                                    });
                                  },
                                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                                  iconSize: 30,
                                ),
                              ],
                            )
                        )
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.08,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText("Upload Doc*",
                              style: GoogleFonts.openSans(
                                  fontSize: 16
                              ),
                            ),
                            filepath!=null?GestureDetector(
                              onTap: () async{
                                Util util=Util();
                                final file=await util.pickPdfFile();
                                if(file!=null) {
                                  setState((){
                                    filepath=file;
                                    filename=(file.toString().split('/').last);
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.picture_as_pdf_rounded),
                                  Expanded(
                                    child: AutoSizeText(filename.toString(),
                                      style: GoogleFonts.openSans(
                                          fontSize: 8
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ):GestureDetector(
                                onTap: () async{
                                  Util util=Util();
                                  final file=await util.pickPdfFile();
                                  if(file!=null) {
                                    setState((){
                                      filepath=file;
                                      filename=(file.toString().split('/').last);
                                    });
                                  }
                                },

                                child: SvgPicture.asset("images/Upload record.svg",height:MediaQuery.of(context).size.height*0.08,fit: BoxFit.fill,))
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                              BorderRadius.circular(40.0),
                            ),
                            width: MediaQuery.of(context).size.width/2,
                            height: 50,
                            child:  Center(
                              child: Text(
                                "Add Project",
                                style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
