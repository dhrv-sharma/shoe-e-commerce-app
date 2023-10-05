import 'package:flutter/material.dart';

class ProductNotifiers extends ChangeNotifier {
  int _activepage=0;

  int get activepage => _activepage;
  set  activepage (int newIndex){
    _activepage = newIndex;
    notifyListeners();
  }
}