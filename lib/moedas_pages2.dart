import 'package:cripto_moedas/model/moeda.dart';
import 'package:cripto_moedas/pages/moedas_detalhes_page2.dart';
import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPages2 extends StatefulWidget {
  const MoedasPages2({Key? key}) : super(key: key);

  @override
  State<MoedasPages2> createState() => _MoedasPages2State();
}

class _MoedasPages2State extends State<MoedasPages2> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionada = [];

  appBarDinamica() {
    if (selecionada.isNotEmpty) {
      return AppBar(
        title: Center(child: Text('${selecionada.length} Moedas')),
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: (() {
            setState(() {
              selecionada = [];
            });
          }),
          icon: const Icon(Icons.remove_shopping_cart_sharp),
        ),
      );
    } else {
      return AppBar(
        title: const Text('Moedas Página 2'),
      );
    }
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage2(moeda: moeda),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDinamica(),
        body: ListView.separated(
            itemBuilder: (context, int moeda) => ListTile(
                  leading: (selecionada.contains(tabela[moeda]))
                      ? const CircleAvatar(
                          child: Icon(Icons.check),
                        )
                      : SizedBox(
                          width: 40, child: Image.asset(tabela[moeda].icon)),
                  title: Text(tabela[moeda].nome),
                  trailing: Text(
                    real.format(tabela[moeda].preco),
                  ),
                  selected: selecionada.contains(tabela[moeda]),
                  selectedTileColor: Colors.red[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onLongPress: () {
                    setState(() {
                      (selecionada.contains(tabela[moeda])
                          ? selecionada.remove(tabela[moeda])
                          : selecionada.add(tabela[moeda]));
                      print(tabela[moeda].nome);
                    });
                  },
                  onTap: () => mostrarDetalhes(tabela[moeda]),
                ),
            padding: EdgeInsets.all(16),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: tabela.length),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: (selecionada.isNotEmpty)
            ? FloatingActionButton.extended(
                icon: const Icon(Icons.star),
                onPressed: () {},
                label: const Text('FAVORITAR'),
              )
            : null);
  }
}
