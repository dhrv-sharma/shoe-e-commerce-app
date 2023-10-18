import 'package:ecommerce/loginpage.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class needLogin extends StatefulWidget {
  const needLogin({super.key});

  @override
  State<needLogin> createState() => _needLoginState();
}

class _needLoginState extends State<needLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.grey.shade300, // Navigation bar
          statusBarColor: Colors.white, // Status bar
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.qr_code_scanner,
          size: 25,
          color: Colors.black,
        ),
        actions: [
          // all these child inside actions are on right hand side
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/india.png",
                    width: 15.w,
                    height: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 15,
                    width: 1.w,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "IND",
                    style: appstyle(16, Colors.black, FontWeight.normal),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Icon(
                      SimpleLineIcons.settings,
                      size: 18,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 750.h,
          decoration: BoxDecoration(color: Colors.grey.shade300),
          child: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: CircleAvatar(
                                backgroundImage: const AssetImage(
                                  "images/user.jpeg",
                                ),
                                backgroundColor:
                                    Colors.grey.shade300, // user profile
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              margin: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Hello , Please Login into your Account",
                                style: appstyle(
                                    12, Colors.black, FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => loginPage()));
                        },
                        child: Container(
                          width: 50.w,
                          height: 30.h,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: Text(
                              "Login",
                              style:
                                  appstyle(12, Colors.white, FontWeight.normal),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
