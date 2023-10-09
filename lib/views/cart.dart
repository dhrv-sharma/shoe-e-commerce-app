import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/CheckOutButton.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/services/helper.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  // we will recieve shoesList  of all cart shoes

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = true;

  List<String> shoe_id = [];
  List<String> shoe_fav = [];
  List<String> shoe_cat = [];

  late Future<List<Sneakers>> cartShoes;

  final user = FirebaseAuth.instance.currentUser!;

  // method to get fav shoes from the firebase
  Future<void> getUsersShoes(String mail) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(mail)
        .collection("shoes")
        .get()
        .then((value) {
      value.docs.forEach((shoe) {
        Map myShoe = shoe.data();

        if (myShoe['cart'] == null) {
          shoe_fav.add("false");
        } else {
          shoe_fav.add(myShoe['cart']);
        }

        shoe_id.add(myShoe['id']);
        shoe_cat.add(myShoe['gend']);
      });
      setState(() {
        isLoading = false;
        cartShoes =
            helper().getListCARTSneakersById(shoe_id, shoe_cat, shoe_fav);
      });
    });
  }

  void getdetails() async {
    await getUsersShoes(user.email.toString()); // here is the user mail id
  }

  @override
  void initState() {
    super.initState();
    getdetails();
    cartShoes = helper().getListCARTSneakersById(shoe_id, shoe_cat, shoe_fav);

    // set state is used as line 60 get already exexuted
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade300, // status bar color
    ));
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "My Cart",
                  style: appstyle(36, Colors.black, FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: FutureBuilder(
                      future: cartShoes,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          print(" Error ${snapshot.error}");

                          return Text(" Error ${snapshot.error}");
                        } else {
                          final shoesList = snapshot.data;
                          return isLoading
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  )))
                              : ListView.builder(
                                  // list view have in built the scroll view
                                  itemCount: shoesList!.length,
                                  padding: const EdgeInsets.all(0),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        child: Slidable(
                                            key: const ValueKey(0),
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              children: [
                                                SlidableAction(
                                                  flex: 1,
                                                  onPressed: (context) {
                                                    print("delted");
                                                  },
                                                  backgroundColor:
                                                      const Color(0xFF000000),
                                                  foregroundColor: Colors.white,
                                                  icon: Icons.delete,
                                                  label: 'Delete',
                                                ),
                                              ],
                                            ),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.11,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors
                                                            .grey.shade500,
                                                        spreadRadius: 5,
                                                        blurRadius: 0.3,
                                                        offset:
                                                            const Offset(0, 1))
                                                  ]),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              shoesList[index]
                                                                  .imageUrl[0],
                                                          width: 70,
                                                          height: 70,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            shoesList[index]
                                                                .name,
                                                            style: appstyle(
                                                                16,
                                                                Colors.black,
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            shoesList[index]
                                                                .category,
                                                            style: appstyle(
                                                                14,
                                                                Colors.grey,
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "\$${shoesList[index].price}",
                                                                style: appstyle(
                                                                    18,
                                                                    Colors
                                                                        .black,
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                              const SizedBox(
                                                                width: 20,
                                                              ),
                                                              Text(
                                                                "Size:",
                                                                style: appstyle(
                                                                    18,
                                                                    Colors.grey,
                                                                    FontWeight
                                                                        .bold),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              // Text(
                                                              //   shoesList[index]
                                                              //       .sizes[0],
                                                              //   style: appstyle(
                                                              //       18,
                                                              //       Colors.grey,
                                                              //       FontWeight
                                                              //           .bold),
                                                              // ),
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          16))),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    // cartProvider.increment();
                                                                  },
                                                                  child:
                                                                      const Icon(
                                                                    AntDesign
                                                                        .minussquare,
                                                                    size: 20,
                                                                    color: Colors
                                                                        .grey,
                                                                  )),
                                                              Text(
                                                                "1",
                                                                style: appstyle(
                                                                  16,
                                                                  Colors.black,
                                                                  FontWeight
                                                                      .w600,
                                                                ),
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    // cartProvider.decrement();
                                                                  },
                                                                  child:
                                                                      const Icon(
                                                                    AntDesign
                                                                        .plussquare,
                                                                    size: 20,
                                                                    color: Colors
                                                                        .black,
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                      // ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                    );
                                  });
                        }
                      }),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: checkButton(onTap: () {}, label: "Proceed to CheckOut"),
            )
          ],
        ),
      ),
    );
  }
}

void doNothing() {}
