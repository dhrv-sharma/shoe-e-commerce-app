import 'package:ecommerce/cartpage.dart';
import 'package:ecommerce/favouratepage.dart';
import 'package:ecommerce/loginpage.dart';
import 'package:ecommerce/orders.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:ecommerce/views/shared/tiles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
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
                height: 80.h,
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
                              margin: const EdgeInsets.only(top: 7),
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Dhruv Sharma",
                                    style: appstyle(
                                        12, Colors.black, FontWeight.w600),
                                  ),
                                  Text(
                                    FirebaseAuth.instance.currentUser!.email
                                        .toString(),
                                    style: appstyle(
                                        12, Colors.black, FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Feather.edit,
                            color: Colors.black,
                            size: 18,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Column(
                children: [
                  Container(
                    height: 160.h,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TilesWidget(
                            OnTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => myOrders()));
                            },
                            title: "Order",
                            leading: MaterialCommunityIcons.truck_fast_outline),
                        TilesWidget(
                            OnTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Favourates()));
                            },
                            title: "My Favourates",
                            leading: MaterialCommunityIcons.heart_outline),
                        TilesWidget(
                            OnTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => cartPage(
                                            value: 1,
                                          )));
                            },
                            title: "Cart",
                            leading: Fontisto.shopping_bag_1)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    height: 110.h,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TilesWidget(
                            OnTap: () {},
                            title: "Coupons",
                            leading: MaterialCommunityIcons.tag_outline),
                        TilesWidget(
                            OnTap: () {},
                            title: "My Store",
                            leading: MaterialCommunityIcons.shopping_outline),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    height: 160.h,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TilesWidget(
                            OnTap: () {},
                            title: "Shipping Address",
                            leading: SimpleLineIcons.location_pin),
                        TilesWidget(
                            OnTap: () {},
                            title: "Settings",
                            leading: SimpleLineIcons.settings),
                        TilesWidget(
                            OnTap: () {},
                            title: "Logout",
                            leading: AntDesign.logout),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
