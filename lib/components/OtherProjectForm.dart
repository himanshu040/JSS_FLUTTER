import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/Presenter/submitFormWithFilesPresenter.dart';
import 'package:jss_flutter/components/custom_dropdown.dart';
import 'package:jss_flutter/constants/Strings.dart';
import 'package:jss_flutter/constants/constants.dart';
import 'package:jss_flutter/models/Request/RequestUploadFile.dart';
import 'package:jss_flutter/models/Response/ResponseFileUpload.dart';
import 'package:jss_flutter/models/Response/ResponseValidateRcForm.dart';
import 'package:jss_flutter/utility/Util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/UrlEndPoints.dart';

class OtherProjectForm extends StatefulWidget {
   OtherProjectForm(this.darpanId,{Key? key}) : super(key: key);
   String darpanId;
  @override
  State<OtherProjectForm> createState() => _OtherProjectFormState();
}

class _OtherProjectFormState extends State<OtherProjectForm> implements ResponseSubmitFormsWithFilesPresenter{

 late PresenterSubmitFormWithFiles presenterSubmitFormWithFiles;
 TextEditingController year=TextEditingController();
 TextEditingController name=TextEditingController();
 TextEditingController amount=TextEditingController();
 TextEditingController number=TextEditingController();
  File? filepath;
  String? filename;
 File? tempfilepath;
 String? tempfilename;
  List<UploadedFile> uploadedFile=[];
  List<String> fundedBy=["Central Government",
    "State Government",
     "Local Bodies ( Nigam, Mission, Corporation)",
     "CSR",
    "Self Sponsored",
     "FCRA"];
  List<String> focusArea=["Education",
  "Social",
  "Health",
  "Rural Dev."];
  List<String> statusOfprogramm=["Completed",
  "Ongoing"];
  List<int> fundedByGid=[209 ,
    210 ,
    211,
    212,
    213,
    348];
  int fundedindex=-1;
  int focusAreaindex=-1;
  int statusOfprogrammindex=-1;
  int? fundedByGidValue;
  String? fundedByvalue;
  String? focusAreaValue;
  String? statusOfprogrammValue;
  bool isloader=false;
 final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  void initState()
  {
    presenterSubmitFormWithFiles=PresenterSubmitFormWithFiles(this);

    super.initState();
  }
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
                child: Form(
                  key: _formKey,
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Year",
                                style: GoogleFonts.openSans(
                                    fontSize: 16
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.30,
                                  child: TextFormField(
                                    controller: year,
                                    validator: (String? value){
                                      if(value!.isEmpty)
                                        return "Please enter Year";
                                    },
                                    keyboardType: TextInputType.number,
                                    cursorColor: Colors.orange,
                                    style: GoogleFonts.openSans(
                                        fontSize: 16
                                    ),

                                    decoration: InputDecoration(
                                      isDense: true,
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
                              AutoSizeText("Name of Programme",
                                style: GoogleFonts.openSans(
                                    fontSize: 16
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.30,
                                  child: TextFormField(
                                    controller: name,
                                    minLines: 1, // any number you need (It works as the rows for the textarea)
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 6,
                                    cursorColor: Colors.orange,
                                    style: GoogleFonts.openSans(
                                        fontSize: 16
                                    ),
                                    validator: (String? value){
                                      if(value!.isEmpty)
                                        return "Please enter program";
                                    },
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
                                    controller: amount,
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
                              height: MediaQuery.of(context).size.height*0.05,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText("Focus Area",
                                    style: GoogleFonts.openSans(
                                        fontSize: 16
                                    ),
                                  ),
                                  CustomDropdownButton(
                                    hint: 'Select',
                                    dropdownItems: focusArea,
                                    buttonWidth: MediaQuery.of(context).size.width*0.40,
                                    buttonHeight: MediaQuery.of(context).size.height*0.05,
                                    dropdownWidth:MediaQuery.of(context).size.width*0.40,
                                    buttonDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent,
                                        border: Border.all(color: Color(0xffAFA6A6)
                                        )
                                    ),
                                    value:focusAreaindex==-1?null: focusArea[focusAreaindex],
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        focusAreaValue = value;
                                        focusAreaindex=focusArea.indexOf(value);
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
                              AutoSizeText("No of Persons",
                                style: GoogleFonts.openSans(
                                    fontSize: 16
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.30,
                                  child: TextFormField(
                                    controller: number,
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
                             filepath!=null ?
                             GestureDetector(
                               onTap: () async{
                                // if (_formKey.currentState!.validate())
                                 if (true)
                                 {
                                          Util util = Util();
                                          final file = await util.pickPdfFile();
                                          if (file != null) {
                                         //   uploadFile(file);
                                           // tempfilepath=file;
                                            setState(() {
                                              filepath = file;
                                              filename = (file
                                                  .toString()
                                                  .split('/')
                                                  .last);
                                            });

                                          }
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
                             ):
                             GestureDetector(
                                  onTap: () async{
                                   // if (_formKey.currentState!.validate())
                                    if (true)
                                    {
                                          Util util = Util();
                                          final file = await util.pickPdfFile();
                                          if (file != null) {
                                           // uploadFile(file);
                                          //  tempfilepath=file;
                                            setState(() {
                                              filepath = file;
                                              filename = (file
                                                  .toString()
                                                  .split('/')
                                                  .last);
                                            });
                                          }
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
                    ),

                  ],
                ),
              ),
            );
  }
  Future<void> uploadFile (File? file)async
  {
    FocusManager.instance.primaryFocus?.unfocus();
    loader();
    Uint8List imgbytes = await file!.readAsBytes();
    print(imgbytes);
    FileUpload fileupload=FileUpload(
        moduleType: "OTHER_PROJECT",
      sectionType: "othrproj_evidence",
      contentType: "File",
         filename:tempfilepath.toString().split('/').last,
    file: imgbytes,
    fileText1: year.text,
    fileText2: name.text);
    String url=BASE_URL+UPLOAD_FILES;
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String? transactionId=preferences.getString(TSNID);
    String? param11=preferences.getString(PARAM11);
    RequestFileUpload requestFileUpload=RequestFileUpload(
      transactionId: transactionId,
      param15: widget.darpanId,
      param11: int.parse(param11.toString()),
      param13: "BASE",
      source: source,
      fileUpload: fileupload
    );
   print(requestFileUpload);
    Util util = new Util();
    bool isOnline = await util.hasInternet();

    if (isOnline) {
      return presenterSubmitFormWithFiles.uploadFile(url, context,requestFileUpload.toMap());
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
  @override
  void onErrorUploadFile(String errorTxt) {
    // TODO: implement onErrorUploadFile
    Navigator.of(context).pop();
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
  void onResponseUploadFile(ResponseFileUpload responseDto) {
    // TODO: implement onResponseUploadFile
    Navigator.of(context).pop();
    Fluttertoast.showToast(
        msg: responseDto.statusDesc.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.black,
        fontSize: 16.0);
    setState(() {
      filepath = tempfilepath;
      filename = (tempfilepath
          .toString()
          .split('/')
          .last);
    });
  }
}
