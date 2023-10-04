import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("profilepage",style: appstyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}