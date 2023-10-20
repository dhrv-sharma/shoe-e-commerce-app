import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/services/helper.dart';
import 'package:ecommerce/views/productpage.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class myOrders extends StatefulWidget {
  const myOrders({super.key});

  @override
  State<myOrders> createState() => _myOrdersState();
}

class _myOrdersState extends State<myOrders> {
  final user = FirebaseAuth.instance.currentUser!;
  late Future<List<Sneakers>> PaidOrders;
  bool isLoading = true;
  List<String> shoe_id = [];
  List<String> shoe_cat = [];
  Map<String, String> delivery = {};
  Map<String, String> pay_price = {};

  Future<void> getUsersShoes(String mail) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(mail)
        .collection("ordered")
        .get()
        .then((value) {
      value.docs.forEach((shoe) {
        Map myShoe = shoe.data();
        shoe_id.add(myShoe['id']);
        shoe_cat.add(myShoe['gend']);
        delivery["${myShoe['id']}"] = myShoe["delivered"];
        pay_price["${myShoe['id']}"] = myShoe["amount"];
      });
      setState(() {
        isLoading = false;
        PaidOrders = helper().getorderedSneakersById(shoe_id, shoe_cat);
      });
    });
  }

  void getdetails() async {
    await getUsersShoes(user.email.toString()); // here is the user mail id
  }

  @override
  void initState() {
    super.initState();
    PaidOrders = helper().getorderedSneakersById(shoe_id, shoe_cat);
    getdetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black, // Navigation bar
          statusBarColor: Colors.black, // Status bar
        ),
        toolbarHeight: 50.h,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Orders",
                  style: appstyle(36, Colors.white, FontWeight.bold),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 650.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        )
                      : FutureBuilder(
                          future: PaidOrders,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(),
                              );
                            } else if (snapshot.hasError) {
                              return Text("error loading ",
                                  style: appstyle(
                                      18, Colors.black, FontWeight.bold));
                            } else {
                              final products = snapshot.data;

                              return products!.isEmpty
                                  ? Container(
                                      padding: EdgeInsets.only(right: 50.w),
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300),
                                      child: Center(
                                        child: Image.asset("images/pose.png"),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: products!.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        productPage(
                                                            id: products[index]
                                                                .id,
                                                            category:
                                                                products[index]
                                                                    .category,
                                                            shoesize:
                                                                products[index]
                                                                    .sizes)));
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.all(8),
                                            padding: const EdgeInsets.all(8),
                                            height: 75.h,
                                            decoration: const BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      decoration: const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Image.network(
                                                          products[index]
                                                              .imageUrl[0],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          products[index].name,
                                                          style: appstyle(
                                                              12,
                                                              Colors.black,
                                                              FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Container(
                                                          width: 325 * 0.6,
                                                          child: FittedBox(
                                                            // aoutomatically fits the text in the particular container
                                                            child: Text(
                                                              products[index]
                                                                  .title,
                                                              style: appstyle(
                                                                  16,
                                                                  Colors.grey
                                                                      .shade700,
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Text(
                                                          "\$ ${pay_price["${products[index].id}"].toString()}",
                                                          style: appstyle(
                                                              12,
                                                              Colors.grey
                                                                  .shade600,
                                                              FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      25),
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          12))),
                                                          child: Text(
                                                            "PAID",
                                                            style: appstyle(
                                                                12,
                                                                Colors.white,
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 5,
                                                                  vertical: 5),
                                                          decoration: const BoxDecoration(
                                                              color: Colors
                                                                  .black12,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          12))),
                                                          child: Row(
                                                            children: [
                                                              const Icon(
                                                                MaterialCommunityIcons
                                                                    .truck_fast_outline,
                                                                color: Colors
                                                                    .black,
                                                                size: 14,
                                                              ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              Text(
                                                                delivery[
                                                                        "${products[index].id}"]
                                                                    .toString(),
                                                                style: appstyle(
                                                                    10,
                                                                    Colors
                                                                        .black,
                                                                    FontWeight
                                                                        .normal),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                            }
                          }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
