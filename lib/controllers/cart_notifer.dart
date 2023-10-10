import 'package:flutter/material.dart';

class cart_Notifer extends ChangeNotifier {
  Map<String, String> _quantity = {};

  Map<String, String> get qunatity => _quantity;

  String quant_rec(String id) {
    return _quantity[id].toString();
  }

// setting the qunatity set of cart page
  void qunat_set(Map<String, String> quant) {
    _quantity.addAll(quant);
  }

  // value got change
  void quant_set_plus(String id) {
    int num = int.parse(_quantity[id].toString());
    print(num);
    _quantity[id] = "${num + 1}";
    notifyListeners();
  }

// value dedcuted
  void qunat_set_min(String id) {
    int num = int.parse(_quantity[id].toString());
    if (num > 1) {
      _quantity[id] = "${num - 1}";
    }
    notifyListeners();
  }
}
