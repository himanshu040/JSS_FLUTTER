import 'dart:collection';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Infra extends StatefulWidget {
  const Infra({Key? key}) : super(key: key);

  @override
  State<Infra> createState() => _InfraState();
}

class _InfraState extends State<Infra> {

  List<String> selectFacility=["Yes","No"];
  int indexFacility=-1;
  String? facilit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { FocusManager.instance.primaryFocus?.unfocus();

      },
      child: Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
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
              Container(
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
                              "Infrastructure",
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
                      height:MediaQuery.of(context).size.height*0.791,
                      width: MediaQuery.of(context).size.width,
                      padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05,
                        left:MediaQuery.of(context).size.width*0.02,
                        right:MediaQuery.of(context).size.width*0.02,),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(50) ,
                              topRight:Radius.circular(50) )
                      ),
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height:MediaQuery.of(context).size.height*0.05,
                              child: AutoSizeText(
                                "Office Space Details",
                                style: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600

                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.04,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText("Total Office Space",
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
                                       suffixText: "sq. ft."
                                    ),
                                  )
                                  )
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: AutoSizeText("Basic Facility(Drinking Water/Toilet)",
                                      style: GoogleFonts.openSans(
                                          fontSize: 16
                                      ),
                                    ),
                                  ),
                                  CustomDropdownButton2(
                                    hint: 'Select',
                                    dropdownItems: selectFacility,
                                   buttonWidth: MediaQuery.of(context).size.width*0.30,
                                    buttonHeight: MediaQuery.of(context).size.height*0.05,
                                    dropdownWidth:MediaQuery.of(context).size.width*0.30,
                                    buttonDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent,
                                        border: Border.all(color: Color(0xffAFA6A6)
                                        )
                                    ),
                                    value:indexFacility==-1?null: selectFacility[indexFacility],
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        facilit = value;
                                        indexFacility=selectFacility.indexOf(value);
                                      });
                                    },
                                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                                    iconSize: 30,
                                  ),
                                ],
                              )
                            )
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.60,
                              child: AutoSizeText("Upload Building Images(1-3)*",
                                style: GoogleFonts.openSans(
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.80,
                              height: MediaQuery.of(context).size.height*0.10,
                              child:ListView.builder(
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:(context,index){
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 2,vertical: 1),
                                  height: MediaQuery.of(context).size.height*0.10,
                                  width: MediaQuery.of(context).size.height*0.10,
                                  child: Container(
                                    color: Color(0xffa1cbf1).withOpacity(0.4),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.height*0.05,
                                    ),
                                  ),
                                );
                              } )
                            ),
                          ),
                          SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height:MediaQuery.of(context).size.height*0.05,
                              child: AutoSizeText(
                                "Training Centres",
                                style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600

                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.04,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText("No of Training Centers",
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
                                            fontSize: 16,
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
                          SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height:MediaQuery.of(context).size.height*0.05,
                              child: AutoSizeText(
                                "Tools/Equipments Available for Training",
                                style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.05,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: AutoSizeText("No of trades for which tool/equipments are available",
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
                                          fontSize: 16,
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
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child:  Center(
                                    child: Text(
                                      "Submit",
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


                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}