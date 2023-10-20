import 'dart:io';

import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/views/paid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class paymenTpage extends StatefulWidget {
  paymenTpage({super.key, required this.orderedShoes, required this.quant});

  List<Sneakers> orderedShoes;
  List<String> quant;

  @override
  State<paymenTpage> createState() => _paymenTpageState();
}

class _paymenTpageState extends State<paymenTpage> {
  final List<PriceItem> _priceItems = [];

  void setData() {
    int index = 0;
    widget.orderedShoes.forEach((element) {
      _priceItems.add(PriceItem(
          name: element.name,
          quantity: int.parse(widget.quant[index]),
          totalPriceCents: int.parse(element.price.split(".")[0]) *
              100 *
              int.parse(widget.quant[index])));
      index++;
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.grey.shade100, // Navigation bar
            statusBarColor: Colors.grey.shade100, // Status bar
          ),
        ),
        body: CheckoutPage(
          priceItems: _priceItems,
          payToName: 'Nike Officials',
          displayNativePay: true,
          onNativePay: () {
            int index = 0;
            widget.orderedShoes.forEach((element) async {
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("ordered")
                  .add({
                "id": "${element.id}",
                "gend": "${element.category}",
                "paid": "true",
                "delivered": "pending",
                "amount":
                    "${int.parse(element.price.split(".")[0]) * int.parse(widget.quant[index])}"
              });

              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.email)
                  .collection("shoes")
                  .doc(element.id)
                  .update({"cart": "false", "quantity": "1"});
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => successfull()));
          },
          isApple: Platform.isIOS,
          onCardPay: (results) =>
              print('Credit card form submitted with results: $results'),
          onBack: () => Navigator.of(context).pop(),
        ));
  }
}
