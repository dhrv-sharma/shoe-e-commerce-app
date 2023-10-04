import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("cartpage",style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}