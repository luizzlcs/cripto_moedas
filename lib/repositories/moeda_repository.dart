import 'package:cripto_moedas/model/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icon: 'images/bitcoin.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 164603.00,
    ),
    Moeda(
      icon: 'images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETH',
      preco: 9716.00,
    ),
    Moeda(
      icon: 'images/xrp.png',
      nome: 'XRP',
      sigla: 'XRP',
      preco: 3.34,
    ),
    Moeda(
      icon: 'images/usdcoin.png',
      nome: 'USD Coin',
      sigla: 'USD',
      preco: 5.02,
    ),
    Moeda(
      icon: 'images/cardano.png',
      nome: 'Cardano',
      sigla: 'CDO',
      preco: 6.32,
    ),
    Moeda(
      icon: 'images/litecoin.png',
      nome: 'Litecoin',
      sigla: 'LTC',
      preco: 669.93,
    ),
  ];
}
