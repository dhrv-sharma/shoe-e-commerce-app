import 'dart:io';

import 'package:flutter/material.dart';
import 'package:checkout_screen_ui/checkout_page.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  /// Build a list of what the user is buying
  final List<PriceItem> _priceItems = [
    PriceItem(name: 'Product A', quantity: 1, totalPriceCents: 5200),
    PriceItem(name: 'Product B', quantity: 2, totalPriceCents: 8599),
    PriceItem(name: 'Product C', quantity: 1, totalPriceCents: 2499),
    PriceItem(name: 'Delivery Charge', quantity: 1, totalPriceCents: 1599),
  ];

// build the checkout ui

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckoutPage(
        priceItems: _priceItems,
        payToName: 'Vendor Name Here',
        displayNativePay: true,
        onNativePay: () => print('Native Pay Clicked'),
        isApple: Platform.isIOS,
        onCardPay: (results) =>
            print('Credit card form submitted with results: $results'),
        onBack: () => Navigator.of(context).pop(),
      ),
    );
  }
}
