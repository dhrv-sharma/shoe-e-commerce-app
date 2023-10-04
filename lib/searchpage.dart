import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("searchpage",style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}