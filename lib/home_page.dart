import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Página inicial'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/moedas');
              },
              icon: const Icon(Icons.android),
              label: const Text('Exemplo 1'),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/moedas2');
              },
              icon: const Icon(Icons.apple_sharp),
              label: const Text('Exemplo 2'),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/moedas3');
              },
              icon: const Icon(Icons.window_sharp),
              label: const Text('Exemplo 3'),
            ),
          ],
        ),
      ),
    );
  }
}
