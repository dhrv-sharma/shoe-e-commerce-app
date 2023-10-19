import 'dart:ffi';

import 'package:flutter/material.dart';

class cart_Notifer extends ChangeNotifier {
  Map<String, String> _quantity = {};

  Map<String, String> get qunatity => _quantity;

  Map<String, String> _checked = {};
  Map<String, String> get checked => _checked;

  void checked_data_set(Map<String, String> temp) {
    _checked.addAll(temp);
  }

  String checked_data_get(String id) {
    return _checked["${id}"].toString();
  }

  bool check_true() {
    return _checked.containsValue("true");
  }

  Null data_set(String id) {
    if (_checked["${id}"].toString() == "false" &&
        _quantity[id].toString() != "null") {
      _checked["${id}"] = "true";
    } else {
      _checked["${id}"] = "false";
    }

    print(_checked);

    notifyListeners();
    return null;
  }

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
