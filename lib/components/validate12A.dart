import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Response/ResponseValidateRcForm.dart';
import '../utility/Util.dart';

Widget v12A(CompDetail compDetails,int indexComponent )
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    indexComponent==0? "Certificate 80G Number":"Certificate 12A Number",
                    style: GoogleFonts.openSans(
                        color: Colors.grey),
                    maxFontSize: 18,
                    minFontSize: 10,
                  ),
                  AutoSizeText(
                    indexComponent==0?compDetails.cert80G.toString():compDetails.cert12A.toString(),
                    style: GoogleFonts.openSans(
                        fontWeight:
                        FontWeight.w600),
                    maxFontSize: 16,
                    minFontSize: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              AutoSizeText("Uploaded Files",
                style: GoogleFonts.openSans(
                    color: Colors.grey,
                    fontSize: 18
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
                        height: 50,
                        child: ListTile(
                          title: AutoSizeText(
                            compDetails.uploadedFiles![index].filename.toString(),
                            style: GoogleFonts.openSans(
                                fontSize: 16,
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
  return files*58;

}