import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jss_flutter/components/DataWidget.dart';


import '../models/Response/ResponseValidateRcForm.dart';
import '../utility/Util.dart';

Widget skills(CompDetail compDetails,BuildContext context)
{
  return ClipRRect(
    child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Table(
                defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width*0.45),
                children: [
                  TableRow(
                      children: [
                        data("Project Year",compDetails.year),
                        data("Name of Project", compDetails.projectName),
                      ]
                  ),
                  TableRow(
                      children: [
                        data("Amount Sectioned", compDetails.sanctionAmount.toString()),
                        data("Sponsored Agency Type",compDetails.sponsrdAgencyGid.toString()),
                      ]
                  ),
                  TableRow(
                      children: [
                        data("Sector/Trade", compDetails.sectorTrade.toString()),

                        data("Project Successfully Completed", compDetails.projCompletd.toString()),

                      ]
                  ),
                  TableRow(
                      children: [
                        data("Sponsor Agency Name", compDetails.sponsrdAgencyName.toString()),
                        data("", ""),
                      ]
                  ),
                  TableRow(
                      children: [
                        data("Total Beneficiary Trained", compDetails.benefTrained.toString()),
                        data("Total Beneficiary Placed", compDetails.benefPlaced.toString()),
                      ]
                  ),

                ],
              ),
              const SizedBox(height: 10,),

              AutoSizeText("Uploaded Files",
                style: GoogleFonts.openSans(
                    color: Colors.grey,
                    fontSize: 12
                ),
              ),
              compDetails.uploadedFiles==null ?
              SizedBox(
                height: 20,
              ):
              SizedBox(
                height: getHeight(compDetails.uploadedFiles!.length),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: ()  {
                        Util util=Util();
                        util.onPressPDF(context,compDetails.uploadedFiles![index].fileUrl.toString());
                      },
                      child: SizedBox(
                        height: 30,
                        child: ListTile(
                          title: AutoSizeText(
                            compDetails.uploadedFiles![index].filename.toString(),
                            style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          trailing: const Icon(Icons.download,color: Color(0xffff8000),),
                        ),
                      ),
                    );

                  },
                  itemCount: compDetails.uploadedFiles!.length,

                ),
              ),


            ],
          ),
        )
    ),
  );


}

double getHeight(int files)
{
  return files*35;

}