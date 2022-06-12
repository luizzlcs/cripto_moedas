import 'package:cripto_moedas/model/moeda.dart';
import 'package:cripto_moedas/pages/moedas_detalhe_page.dart';
import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionada = [];

  appBarDinamica() {
    if (selecionada.isEmpty) {
      return AppBar(
        backgroundColor: Colors.purple[400],
        title: const Text('Moedas page 1'),
      );
    } else {
      return AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                selecionada = [];
              });
            },
            icon: const Icon(Icons.playlist_remove_outlined)),
        title: Center(
          child: Text(
            '${selecionada.length} selecionadas',
          ),
        ),
        elevation: 2,
      );
    }
  }

  detalheMoeda(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoedasDetalhePage(moeda: moeda),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarDinamica(),
        body: ListView.separated(
          itemBuilder: (BuildContext contex, int moeda) {
            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              leading: (selecionada.contains(tabela[moeda]))
                  ? const CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(
                      width: 40,
                      child: Image.asset(tabela[moeda].icon),
                    ),
              title: Text(tabela[moeda].nome),
              trailing: Text(
                real.format(tabela[moeda].preco),
              ),
              selected: selecionada.contains(tabela[moeda]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: () {
                setState(() {
                  (selecionada.contains(tabela[moeda])
                      ? selecionada.remove(tabela[moeda])
                      : selecionada.add(tabela[moeda]));
                  print(tabela[moeda].nome);
                });
              },
              onTap: () => detalheMoeda(tabela[moeda]),
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: selecionada.isNotEmpty
            ? FloatingActionButton.extended(
                elevation: 10,
                onPressed: () {},
                label: const Text('FAVORITAR'),
                icon: const Icon(Icons.star),
              )
            : null);
  }
}
