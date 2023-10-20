import 'package:ecommerce/home.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class successfull extends StatefulWidget {
  const successfull({super.key});

  @override
  State<successfull> createState() => _successfullState();
}

class _successfullState extends State<successfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.grey.shade100, // Navigation bar
          statusBarColor: Colors.grey.shade100, // Status bar
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset("images/Checkmark.png"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Paid Successfully ",
                    style: appstyle(35, Colors.black, FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
