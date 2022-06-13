import 'package:cripto_moedas/model/moeda.dart';
import 'package:cripto_moedas/pages/moedas_detalhe_page.dart';
import 'package:cripto_moedas/repositories/favoritas_repository.dart';
import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionada = [];
  late FavoritasRepository favoritas;

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

  limparSelecionadas() {
    setState(() {
      selecionada = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    favoritas = Provider.of<FavoritasRepository>(context);
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
              title: Row(
                children: [
                  Text(
                    tabela[moeda].nome,
                  ),
                  if (favoritas.lista.contains(tabela[moeda]))
                    const Icon(Icons.star, color: Colors.amber, size: 15)
                ],
              ),
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
              onTap: () {
                (selecionada.isEmpty
                    ? detalheMoeda(tabela[moeda])
                    : ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 1,
                          backgroundColor: Colors.amber[600],
                          content: Text(
                            selecionada.length > 1
                                ? 'Remova os itens selecionados!'
                                : 'Remova o item selecionado',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ));
              },
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
                onPressed: () {
                  favoritas.saveAll(selecionada);
                  limparSelecionadas();
                },
                label: const Text('FAVORITAR'),
                icon: const Icon(Icons.star),
              )
            : null);
  }
}
