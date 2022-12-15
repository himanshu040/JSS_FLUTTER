import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jss_flutter/components/DataWidget.dart';


import '../models/Response/ResponseValidateRcForm.dart';

Widget institution(CompDetail compDetails,BuildContext context)
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
                defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width*0.47),
                children: [
                  TableRow(
                      children: [
                        data("Name of Institute",compDetails.insttitueName),
                        data("Type of Institute", compDetails.insttitueType),
                      ]
                  ),
                ],
              ),
              data("Student Enrolled in Last Three Years", compDetails.studentEnrolled.toString()),
              const SizedBox(height: 10,),
              data("Address", compDetails.address!.address.toString()+"\n${compDetails.address!.subdistrict.toString()} , ${compDetails.address!.district} (${compDetails.address!.state}) - ${compDetails.address!.pincode}"),

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