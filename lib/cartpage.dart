import 'package:ecommerce/views/cart.dart';
import 'package:flutter/material.dart';

class cartPage extends StatefulWidget {
  cartPage({super.key, required this.value});

  int value;

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    // in this page we will extract the data from the flutter in mycart dection which will return list of ids and from ids we will extract the data from json file
    return Scaffold(
      body: Center(
        child: CartPage(
          val: widget.value,
        ),
      ),
    );
  }
}
