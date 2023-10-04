import 'package:ecommerce/controllers/mainscreen_providers.dart';
import 'package:ecommerce/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider( // Multiproviders 
    providers: [
      ChangeNotifierProvider(create: (context) => MainScreenNotifier())
    ], // we are using multiproviders hence have to mention all providers 
    child: const MaterialApp(
      home: home(),
    ),
  ));
}
