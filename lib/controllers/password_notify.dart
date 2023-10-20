import 'package:flutter/material.dart';

class Login_notify extends ChangeNotifier {
  bool _issecured = true;

  bool get issecured => _issecured;
  set issecured(bool newstate) {
    _issecured = newstate;
    notifyListeners();
  }
}
