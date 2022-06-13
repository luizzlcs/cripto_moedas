import 'package:cripto_moedas/model/moeda.dart';
import 'package:cripto_moedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoedasPage3 extends StatelessWidget {
  const MoedasPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;
    NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

    detalhesMoeda(Moeda moeda){
      // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Moedas page 3'),
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) => ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                leading: SizedBox(
                  width: 40,
                  child: Image.asset(tabela[index].icon),
                ),
                title: Text(tabela[index].nome),
                trailing: Text(
                  real.format(tabela[index].preco),
                ),
                selected: true,
                selectedTileColor: Colors.grey[200],
                onTap: (){},
              )),
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: tabela.length),
    );
  }
}
