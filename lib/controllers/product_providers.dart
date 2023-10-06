import 'package:flutter/material.dart';

class ProductNotifiers extends ChangeNotifier {
  int _activepage = 0;

  List<dynamic> _shoesSize = [];

// getter method for activepage
  int get activepage => _activepage;

// setter method for activepage
  set activepage(int newIndex) {
    _activepage = newIndex;
    notifyListeners();
  }

// getter method for list varaibles
  List<dynamic> get shoeSizes => _shoesSize;

// set method for list varaibles
  set shoeSizes(List<dynamic> selectedSize) {
    _shoesSize = selectedSize;
    notifyListeners();
  }

  void toggleChecked(int index) {
    for (var i = 0; i < _shoesSize.length; i++) {
      if (i == index) {
        _shoesSize[i]["isSelected"]=!_shoesSize[i]["isSelected"];
      }
    }
    notifyListeners();
  }
}
