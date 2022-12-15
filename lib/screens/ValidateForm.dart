import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/Presenter/submitForm.dart';
import 'package:jss_flutter/Presenter/validateRcFormPresenter.dart';
import 'package:jss_flutter/components/audit.dart';
import 'package:jss_flutter/components/awards.dart';
import 'package:jss_flutter/components/otherProject.dart';
import 'package:jss_flutter/components/skillsProject.dart';
import 'package:jss_flutter/models/Request/RequestSubmitForm.dart';
import 'package:jss_flutter/models/Request/RequestValidateForm.dart';
import 'package:jss_flutter/models/Response/ResponseSubmit.dart';
import 'package:jss_flutter/models/Response/ResponseValidateRcForm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/institution.dart';
import '../components/valdateRegistrationCertificate.dart';
import '../components/validate12A.dart';
import '../constants/UrlEndPoints.dart';
import '../constants/constants.dart';
import '../constants/strings.dart';
import '../utility/Util.dart';


class ValidateRcForm extends StatefulWidget {
  ValidateRcForm(this.darpanId,this.component,this.heading,this.title,{Key? key}) : super(key: key);
  String darpanId;
  String? component;
  String heading;
  String title;

  @override
  State<ValidateRcForm> createState() => _ValidateRcFormState();
}

class _ValidateRcFormState extends State<ValidateRcForm> implements ResponseValidateRcPresenter , ResponseSubmitFormPresenter{

  late PresenterRcForm presenterRcForm;
  late PresenterSubmitForm presenterSubmitForm;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController remarks = TextEditingController();
  late ResponseValidateRcForm responseValidateRcForm;
   bool? verified;
  bool isloader=false;
  bool containervisible=false;
  final controller = ScrollController();

  @override
  void initState()
  {
    responseValidateRcForm=ResponseValidateRcForm();
 // responseValidateRcForm=responseValidateRcFormFromJson(s);
    presenterRcForm=PresenterRcForm(this);
    remarks = TextEditingController(text: "");
    presenterSubmitForm=PresenterSubmitForm(this);
    super.initState();
  }
  scrollToItem(int index)
  {
    final contentSize = controller.position.viewportDimension + controller.position.maxScrollExtent;
    final target = contentSize * index / 3;
    controller.position.animateTo(
      target,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor:  Color(0xffff8000),
        statusBarColor:  Color(0xffff8000),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
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
              setState(() {
                containervisible=false;
              });

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
                            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
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
                      padding:  const EdgeInsets.only(left:25.0),
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
                                else{
                                  if(responseValidateRcForm.component!=null) {
                                    return Form(
                                      key: _formKey,
                                      child: Container(
                                      height:  MediaQuery.of(context).size.height*0.64,
                                        color: Colors.transparent,
                                        child: CustomScrollView(
                                          controller: controller,
                                               shrinkWrap: true,
                                            slivers: [
                                              responseValidateRcForm.component!.compDetails!.isNotEmpty? SliverList(delegate:  SliverChildBuilderDelegate(
                                                  (context,indexComponent){
                                                     return getWidget(responseValidateRcForm.component!.compDetails![indexComponent],indexComponent: indexComponent,context);
                                                  },
                                                childCount:responseValidateRcForm.component!.compDetails!.length
                                              )):
                                              SliverToBoxAdapter(
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Center(
                                                    child: AutoSizeText(
                                                      "No Data Available",
                                                      style: GoogleFonts.openSans(
                                                        fontSize: 18
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
                                              SliverToBoxAdapter(
                                                child: Container(
                                                  padding: EdgeInsets.only(left: 5),
                                                  height: 20,
                                                  child: AutoSizeText(
                                                    "Is Verified",
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 16,
                                                        color:Colors.grey
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SliverToBoxAdapter(
                                                child:   ClipRRect(
                                                    child: Card(
                                                        elevation: 2,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          height: 50,
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Radio(
                                                                activeColor: Colors.orange,
                                                                value: true,
                                                                groupValue: verified,
                                                                onChanged: (bool? value){
                                                                  setState(() {
                                                                    verified = value!;
                                                                  });
                                                                },
                                                              ),
                                                              GestureDetector(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      verified = true;
                                                                    });

                                                                  },


                                                                  child: AutoSizeText("Yes")),

                                                              SizedBox(width: MediaQuery.of(context).size.width/5,),

                                                              Radio(
                                                                activeColor: Colors.orange,
                                                                value: false,
                                                                groupValue: verified,
                                                                onChanged: (bool? value){
                                                                  setState(() {
                                                                    verified = value!;
                                                                  });
                                                                },

                                                              ),
                                                              GestureDetector(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      verified = false;
                                                                    });

                                                                  },
                                                                  child: AutoSizeText("No"))
                                                            ],
                                                          ),
                                                        )
                                                    )
                                                ),),


                                              SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
                                              SliverToBoxAdapter(
                                                child: Container(
                                                  padding: EdgeInsets.only(left: 5),
                                                  height: 20,
                                                  child: AutoSizeText(
                                                    "Remark",
                                                    style: GoogleFonts.openSans(
                                                        fontSize: 16,
                                                        color:Colors.grey
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SliverToBoxAdapter(
                                                child: TextFormField(
                                                  validator: (String? value){
                                                    if(value!.isEmpty)
                                                      return "Please fill some remarks";
                                                  },
                                                  controller: remarks,
                                                  onTap: (){
                                                    scrollToItem(5);
                                                    setState(() {
                                                      containervisible=true;
                                                    });
                                                  },
                                                  minLines: 6, // any number you need (It works as the rows for the textarea)
                                                  keyboardType: TextInputType.multiline,
                                                  maxLines: null,
                                                  cursorColor: Colors.orange,
                                                  decoration: InputDecoration(

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
                                                ),
                                              ),
                                              SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
                                              SliverToBoxAdapter(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (_formKey.currentState!.validate()&&verified!=null)
                                                      submit();
                                                      else
                                                      Fluttertoast.showToast(
                                                          msg: "Please choose verification",
                                                          toastLength: Toast.LENGTH_SHORT,
                                                          gravity: ToastGravity.BOTTOM,
                                                          timeInSecForIosWeb: 1,
                                                          textColor: Colors.white,
                                                          backgroundColor: Colors.black,
                                                          fontSize: 16.0);


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
                                              SliverToBoxAdapter(
                                                child: Visibility(
                                                  visible:containervisible,
                                                  child: SizedBox(
                                                    height: 250,
                                                  ),
                                                ),
                                              )


                                            ],

                                          ),
                                        ),
                                    );
                                  } else
                                    return const Center(
                                      child: Text(
                                          "NO DATA FOUND"
                                      ),
                                    );

                                }

                              }),

                        ],
                      )
                    )

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
    if(responseDto.statusCode!="APP001") {
      Fluttertoast.showToast(
          msg: responseDto!.statusDesc.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          backgroundColor: Colors.black,
          fontSize: 16.0);
    }
    return;
  }
  Widget getWidget(CompDetail compDetails,BuildContext context,{int? indexComponent})
  {
    switch (widget.component)
    {
      case "RC": return vrc(compDetails);
      case "12A80G":return v12A(compDetails,indexComponent!);
      case "SKILL":return skills(compDetails,context);
      case "COMMUNITY":return otherProject(compDetails,context);
      case "INSTITUTE":return institution(compDetails,context);
      case "AWARD":return award(compDetails,context);
      case "AUDIT":return audit(compDetails,context);
      default:return Visibility(
        visible: false,
        child: SizedBox(),
      );
    }
  }

  double getHeight(int files)
  {
    return files*58;
    
  }
  Future<void> submit ()async
  {
   FocusManager.instance.primaryFocus?.unfocus();
    loader();

    String url=BASE_URL+SUBMIT_FORM;
    //  UserPojo user=new UserPojo(loginId:userid.text.toString(),password: password.text.toString(),userType: 5 );
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String? transactionId=preferences.getString(TSNID);
    String? param11=preferences.getString(PARAM11);
    CompDetails compDetail=CompDetails();
    List<CompDetails> compDetails=[compDetail];
    Components components=new Components(isVerified: verified,remarks: remarks.text,compDetails: compDetails);
   RequestSubmitForm requestsubmit=RequestSubmitForm(transactionId:transactionId,param11: int.parse(param11!),
       param13: "BASE",param14:"abvvv12", source: source,
       param12: widget.component, param15: widget.darpanId,component: components);

    Util util = new Util();
    bool isOnline = await util.hasInternet();

    if (isOnline) {
      return presenterSubmitForm.getDetails(url, context,requestsubmit.toMap());
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
  void onErrorSubmitForm(String errorTxt) {
    // TODO: implement onErrorSubmitForm
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
  void onResponseSuccessSubmitForm(ResponseSubmitForm responseDto) {
    // TODO: implement onResponseSuccessSubmitForm
    Fluttertoast.showToast(
        msg: "Submitted successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.black,
        fontSize: 16.0);
    Navigator.of(context).popUntil((route) {
      return route.settings.name == 'BaseLocation';
    });
  }
}
