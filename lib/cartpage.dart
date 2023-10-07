import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/views/cart.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key, required this.shoesList});

  final List<Sneakers> shoesList;

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    // in this page we will extract the data from the flutter in mycart dection which will return list of ids and from ids we will extract the data from json file
    return Scaffold(
      body: Center(
        child: CartPage(shoesList: widget.shoesList),
      ),
    );
  }
}
