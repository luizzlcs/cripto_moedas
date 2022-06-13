import 'dart:collection';

import 'package:cripto_moedas/model/moeda.dart';
import 'package:flutter/material.dart';

class FavoritasRepository extends ChangeNotifier {
  List<Moeda> _lista = [];

  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moeda) {
    moeda.forEach((moeda) {
      if (!_lista.contains(moeda)) _lista.add(moeda);
    });
    notifyListeners();
  }

  remove(Moeda moeda) {
    _lista.remove(moeda);
    notifyListeners();
  }
}
