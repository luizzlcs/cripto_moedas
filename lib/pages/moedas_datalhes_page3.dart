import 'package:flutter/material.dart';
import '../model/moeda.dart';

class MoedasDatalhesPage3 extends StatelessWidget {
  Moeda moeda;

  MoedasDatalhesPage3({ Key? key, required this.moeda }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: Text('widget.Moeda.moeda'),),
           body: Container(),
       );
  }
}