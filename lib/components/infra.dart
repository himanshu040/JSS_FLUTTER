import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfraStructure extends StatefulWidget {
  const InfraStructure({Key? key}) : super(key: key);

  @override
  State<InfraStructure> createState() => _InfraStructureState();
}

class _InfraStructureState extends State<InfraStructure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [

        ],
      ),

    );
  }
}
