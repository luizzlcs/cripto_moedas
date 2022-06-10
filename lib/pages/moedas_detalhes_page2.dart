import 'package:flutter/material.dart';
import '../model/moeda.dart';

class MoedasDetalhesPage2 extends StatefulWidget {
  Moeda moeda;

  MoedasDetalhesPage2({Key? key, required this.moeda}) : super(key: key);

  @override
  State<MoedasDetalhesPage2> createState() => _MoedasDetalhesPageState2();
}

class _MoedasDetalhesPageState2 extends State<MoedasDetalhesPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.moeda.nome)),
      ),
      body: Container(),
    );
  }
}
