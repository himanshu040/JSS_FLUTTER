import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/Presenter/detailsPresenter.dart';
import 'package:jss_flutter/models/Request/RequestDetails.dart';
import 'package:jss_flutter/models/Response/ResponseDetails.dart';
import 'package:jss_flutter/screens/baseLocation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/DataWidget.dart';
import '../../components/modelComponent.dart';
import '../../constants/UrlEndPoints.dart';
import '../../constants/constants.dart';
import '../../constants/strings.dart';
import '../../utility/Util.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> implements ResponseDetailsPresenter {
 late  ResponseDetails responseDetails;
 late PresenterDetails presenterDetails;
 late TextEditingController search;
 bool isloader=false;
 late List<DarpanDetails?> dataList;

  @override
  void initState()
  {
   // String s='{"statusCode": "APP001","statusDesc": "Your request has been processed successfully","transactionId": "1234","darpanDetails": {"darpanId": "AP/2009/0002726","agencyName": "GOWTHAMI FOUNDATION","contactPersonName": "GOWTHAMI FOUNDATION","contactPersonEmail": "gowthamifoundation@gmail.com","contactPersonMobile": "9441887433","pan": "AAATG5968M","address": {"state": "Andhra Pradesh","district": "PRAKASAM","subdistrict": "Ongole","address": "33-055-587, Sri Nagar Colony 1st Line, Kurnool Road, Prakasam District, Andhra Pradesh","pincode": "523002"}}}';
    responseDetails= ResponseDetails();
    presenterDetails=PresenterDetails(this);
    search=TextEditingController(text:"ap/2009/0002726");
    dataList=[];
   // responseDetails=new ResponseDetails();
    super.initState();
  }
  Widget build(BuildContext context) {
    SystemUiOverlayStyle(
      systemNavigationBarColor:  Color(0xffEF8B9E),
      statusBarColor:  Color(0xffEF8B9E),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width,
                decoration:BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color(0xffEF8B9E),
                          Color(0xffFFFFFF)
                        ]
                    )
                ) ,

              ),

              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Search",
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
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.66 ,
                      child: ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Card(
                              elevation: 5,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.02),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height*0.65,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height *
                                              0.05,
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: AutoSizeText(
                                            "Darpan Details",
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),

                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Color(0xff2924201F),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                                          child: Table(
                                            defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width*0.45),
                                            children: [
                                              TableRow(
                                                  children: [
                                                    data("Darpan Id", dataList[index]!.darpanId.toString()),
                                                    data("Agency Name", dataList[index]!.agencyName.toString()),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    data("Contact Person Name", dataList[index]!.contactPersonName.toString()),
                                                    data("Contact Person Email",dataList[index]!.contactPersonEmail.toString()),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    data("Contact Person Mobile", dataList[index]!.contactPersonMobile.toString()),
                                                    data("PAN", dataList[index]!.pan.toString()),
                                                  ]
                                              ),

                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Divider(
                                          height: 1,
                                          color: Color(0xff2924201F),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          height: MediaQuery.of(context).size.height *
                                              0.05,
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                          child: AutoSizeText(
                                            "Address",
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),

                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Color(0xff2924201F),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
                                          child: Table(
                                            defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width*0.45),
                                            children: [
                                              TableRow(
                                                  children: [
                                                    data("State", dataList[index]!.address!.state.toString()),
                                                    data("District", dataList[index]!.address!.district.toString()),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    data("Sub district", dataList[index]!.address!.subdistrict.toString()),
                                                    data("Address", dataList[index]!.address!.address.toString()),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    data("Pincode",dataList[index]!.address!.pincode.toString()),
                                                    data("",""),
                                                  ]
                                              ),

                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap:() {
                                        onTapFilter(responseDetails.darpanDetails!.darpanId.toString());

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:  Color(0xffdd7991),
                                          borderRadius: BorderRadius.circular(40.0),
                                        ),
                                        width: MediaQuery.of(context).size.width/2,
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Start Inspection",
                                            style:
                                            TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )

                    ),
                    )

                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*0.11,
                left:  MediaQuery.of(context).size.width*0.05,
                right: MediaQuery.of(context).size.width*0.05,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
              Container(
                child: AutoSizeText(
                  "",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 15,
                  ),
                ),
              ),
                    SizedBox(height: 5,),
                    Container(
                      padding: EdgeInsets.all(2),
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey,
                             offset: Offset(0.0, 1.0), //(x,y)
                             blurRadius: 6.0,
                           ),
                         ],
                       ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.75
                              ,child: TextField(
                              controller: search,
                                autofocus: false,
                                cursorColor: Colors.grey,
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.openSans(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  fillColor: Colors.grey,
                                  isDense: true,
                                  hintText: "Search by Darpan ID",
                                  hintStyle: GoogleFonts.openSans(
                                      fontSize: 20,
                                    fontWeight: FontWeight.w100
                                  ),
                                  contentPadding: EdgeInsets.all(20),

                                  focusedBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      borderSide: BorderSide(
                                        color: Color(0xffDFDFDF),
                                        width: 1,
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(
                                      color: Color(0xffDFDFDF),
                                      width: 1,
                                    ),

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 2,),
                            GestureDetector(
                              onTap: (){

                                FocusManager.instance.primaryFocus?.unfocus();
                                getData();
                              },
                              child: Container(
                                  width:MediaQuery.of(context).size.width*0.13,
                                  height: MediaQuery.of(context).size.height*0.085,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:   Color(0xffEF8B9E)
                                  ),
                                  child: Icon(Icons.search)),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],

          )
        ),
      ),
    );

  }
 Future<void> getData ()async
 {
   loader();
   String url=BASE_URL+GET_DETAILS;
   SharedPreferences preferences=await SharedPreferences.getInstance();
   String? transactionId=preferences.getString(TSNID);
   String? param11=preferences.getString(PARAM11);
   RequestDetails requestDetails=new RequestDetails(transactionId: transactionId,param11:int.parse(param11.toString()), source: source, param15: search.text.toString().toUpperCase(),param13: "BASE");
   Util util = new Util();
   bool isOnline = await util.hasInternet();

   if (isOnline) {
     return presenterDetails.getDetails(url, context,requestDetails.toMap());
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
  Future<void> onTapFilter(String darpanId) async{
    FocusManager.instance.primaryFocus?.unfocus();
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  decoration: ShapeDecoration(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    color: Colors.white,
                  ),
                  //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.white,
                  alignment: Alignment.centerLeft,
                  //padding: const EdgeInsets.all(16.0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Text(
                      "Tap to view",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BaseLocation(darpanId),
                                      settings: RouteSettings(
                                        name: 'BaseLocation',
                                      )),
                              ).then((value) =>setState((){}));

                            },
                            child: Class_List_component(
                              text: 'Base Location',
                              colour: Color(0xffe69dad),
                              classval: 0,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);

                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: GestureDetector(
                              child: Class_List_component(
                                text: 'Field Location',
                               // colour:Color(0xffe38bb2),
                                colour: Color(0xffe69dad),
                                classval: 1,
                              )),
                        ),
                      )


                    ],
                  ),
                )
              ],
            ),
          );
        });

}

  @override
  void onError(String errorTxt) {
    // TODO: implement onError
    Navigator.pop(context);
    dataList.clear();
    Fluttertoast.showToast(
        msg: errorTxt,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.black,
        fontSize: 16.0);
setState((){});

  }

  @override
  void onResponseSuccess(ResponseDetails responseDto) {
    // TODO: implement onResponseSuccess
    dataList.clear();
    responseDetails=responseDto;
    dataList.add(responseDto!.darpanDetails);
    Navigator.pop(context);
    setState((){});
  }

}
