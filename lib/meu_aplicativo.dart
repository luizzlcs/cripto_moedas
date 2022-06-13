import 'package:cripto_moedas/home_page.dart';
import 'package:cripto_moedas/moedas_page.dart';
import 'package:cripto_moedas/moedas_page3.dart';
import 'package:cripto_moedas/moedas_pages2.dart';
import 'package:flutter/material.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      routes: {
        '/moedas': (context) => const MoedasPage(),
        '/moedas2': (context) => const MoedasPages2(),
        '/moedas3': (context) => const MoedasPage3(),
      },
    );
  }
}
