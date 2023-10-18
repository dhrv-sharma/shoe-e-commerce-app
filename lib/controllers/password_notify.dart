import 'package:flutter/material.dart';

class Login_notify extends ChangeNotifier {
  bool _issecured = false;

  bool get issecured => _issecured;
  set issecured(bool newstate) {
    _issecured = newstate;
    notifyListeners();
  }
}
