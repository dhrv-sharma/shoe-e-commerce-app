import 'package:flutter/material.dart';

// used as a state management process as it notifies the index
class MainScreenNotifier extends ChangeNotifier{
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageset(int newIndex){
    _pageIndex =newIndex;
    notifyListeners(); // want to update ui then it listen the changes 
  }

}