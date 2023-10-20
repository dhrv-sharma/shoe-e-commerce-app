import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/CheckOutButton.dart';
import 'package:ecommerce/controllers/cart_notifer.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/services/helper.dart';
import 'package:ecommerce/views/payment.dart';
import 'package:ecommerce/views/productpage.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key, required this.val});

  // we will recieve shoesList  of all cart shoes

  int val = 0;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = true;
  int length = 0;
  bool check = false;
  int vari = 0;

  List<String> shoe_id = [];
  List<String> shoe_fav = [];
  List<String> shoe_cat = [];
  Map<String, List<dynamic>> shoes_size = {};

  // id,quantity
  Map<String, String> quantity_list = {};

  Map<String, String> temp = {};

  late Future<List<Sneakers>> cartShoes;

  final user = FirebaseAuth.instance.currentUser!;

  List<Sneakers> checkout_shoes = [];
  List<String> checkout_quant = [];

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

        if (myShoe['cart'] == "false") {
          shoe_fav.add("false");
        } else {
          shoe_fav.add(myShoe['cart']);
          if (myShoe["sizes"][0] == "Not Selected") {
            shoes_size["${myShoe["id"]}"] = ["N/A"];
          } else {
            shoes_size["${myShoe["id"]}"] = myShoe["sizes"];
            quantity_list["${myShoe["id"]}"] = myShoe["quantity"];
          }
        }

        temp["${myShoe['id']}"] = "false";

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
      // status bar color
      statusBarColor: Colors.grey.shade300,

      // navigation bar color
      systemNavigationBarColor: Colors.grey.shade300,
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
                widget.val == 1
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          MaterialIcons.close,
                          color: Colors.black,
                        ),
                      )
                    : Container(),
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
                              : Consumer<cart_Notifer>(
                                  builder: (context, cart_notify, child) {
                                  if (vari == 0) {
                                    cart_notify.checked.clear();
                                    cart_notify.checked_data_set(temp);
                                    vari++;
                                  }
                                  check = cart_notify.check_true();

                                  print(check);
                                  if (cart_notify.qunatity.isEmpty) {
                                    // activity opening case
                                    cart_notify.qunat_set(quantity_list);
                                    length++;
                                  } else if (length == 0) {
                                    cart_notify.qunatity.clear();
                                    cart_notify.qunat_set(quantity_list);
                                  }

                                  // fln_shoes(cart_notify.checked);
                                  checkout_shoes.clear();
                                  checkout_quant.clear();

                                  cart_notify.checked.forEach((key, value) {
                                    shoesList!.forEach((element) {
                                      if (element.id == key &&
                                          value == "true") {
                                        checkout_shoes.add(element);
                                        checkout_quant.add(cart_notify
                                            .qunatity[key]
                                            .toString());
                                      }
                                    });
                                  });

                                  return isLoading
                                      ? SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: const Center(
                                              child: CircularProgressIndicator(
                                            color: Colors.black,
                                          )),
                                        )
                                      : shoesList!.isEmpty
                                          ? Center(
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 50.w),
                                                  child: Image.asset(
                                                      "images/pose.png"),
                                                ),
                                              ),
                                            )
                                          : ListView.builder(
                                              // list view have in built the scroll view
                                              itemCount: shoesList!.length,
                                              padding: const EdgeInsets.all(0),
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(12),
                                                    ),
                                                    child: Slidable(
                                                        key: const ValueKey(0),
                                                        endActionPane:
                                                            ActionPane(
                                                          motion:
                                                              const ScrollMotion(),
                                                          children: [
                                                            SlidableAction(
                                                              flex: 1,
                                                              onPressed:
                                                                  (context) async {
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        "users")
                                                                    .doc(user
                                                                        .email
                                                                        .toString())
                                                                    .collection(
                                                                        "shoes")
                                                                    .doc(shoesList[
                                                                            index]
                                                                        .id)
                                                                    .update({
                                                                  "cart":
                                                                      "false",
                                                                  "quantity":
                                                                      "1"
                                                                });
                                                                cart_notify
                                                                    .qunatity
                                                                    .clear();
                                                                await cart_notify
                                                                    .data_set(
                                                                        shoesList[index]
                                                                            .id);
                                                                shoesList.removeWhere(
                                                                    (element) =>
                                                                        element
                                                                            .id ==
                                                                        shoesList[index]
                                                                            .id);
                                                                setState(() {
                                                                  check = cart_notify
                                                                      .check_true();
                                                                });
                                                              },
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFF000000),
                                                              foregroundColor:
                                                                  Colors.white,
                                                              icon:
                                                                  Icons.delete,
                                                              label: 'Delete',
                                                            ),
                                                          ],
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => productPage(
                                                                        id: shoesList[index]
                                                                            .id,
                                                                        category:
                                                                            shoesList[index]
                                                                                .category,
                                                                        shoesize:
                                                                            shoesList[index].sizes)));
                                                          },
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.11,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade100,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade500,
                                                                      spreadRadius:
                                                                          5,
                                                                      blurRadius:
                                                                          0.3,
                                                                      offset:
                                                                          const Offset(
                                                                              0,
                                                                              1))
                                                                ]),
                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                    top: 2,
                                                                    left: 2,
                                                                    child: cart_notify.checked_data_get(shoesList[index].id) ==
                                                                            "true"
                                                                        ? GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              await cart_notify.data_set(shoesList[index].id);
                                                                              setState(() {
                                                                                check = cart_notify.check_true();
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Feather.check_square,
                                                                              size: 20,
                                                                              color: Colors.black,
                                                                            ),
                                                                          )
                                                                        : GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              await cart_notify.data_set(shoesList[index].id);
                                                                              setState(() {
                                                                                check = cart_notify.check_true();
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Icon(
                                                                              Feather.square,
                                                                              size: 20,
                                                                              color: Colors.black,
                                                                            ),
                                                                          )),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              12),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            imageUrl:
                                                                                shoesList[index].imageUrl[0],
                                                                            width:
                                                                                70,
                                                                            height:
                                                                                70,
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              shoesList[index].name,
                                                                              style: appstyle(16, Colors.black, FontWeight.bold),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 5,
                                                                            ),
                                                                            Text(
                                                                              shoesList[index].category,
                                                                              style: appstyle(14, Colors.grey, FontWeight.bold),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 5,
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  "\$${shoesList[index].price}",
                                                                                  style: appstyle(18, Colors.black, FontWeight.bold),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 20,
                                                                                ),
                                                                                Text(
                                                                                  "Size:",
                                                                                  style: appstyle(18, Colors.grey, FontWeight.bold),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Text(
                                                                                  shoes_size["${shoesList[index].id}"]![0],
                                                                                  style: appstyle(18, Colors.grey, FontWeight.bold),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                InkWell(
                                                                                    onTap: () async {
                                                                                      cart_notify.qunat_set_min(shoesList[index].id);
                                                                                      await FirebaseFirestore.instance.collection("users").doc(user.email.toString()).collection("shoes").doc(shoesList[index].id).update({
                                                                                        "quantity": cart_notify.quant_rec(shoesList[index].id)
                                                                                      });
                                                                                      length++;
                                                                                    },
                                                                                    child: const Icon(
                                                                                      AntDesign.minussquare,
                                                                                      size: 20,
                                                                                      color: Colors.grey,
                                                                                    )),
                                                                                Text(
                                                                                  cart_notify.quant_rec(shoesList[index].id) == "null" ? "-" : cart_notify.quant_rec(shoesList[index].id),
                                                                                  style: appstyle(
                                                                                    16,
                                                                                    Colors.black,
                                                                                    FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                    onTap: () async {
                                                                                      cart_notify.quant_set_plus(shoesList[index].id);
                                                                                      await FirebaseFirestore.instance.collection("users").doc(user.email.toString()).collection("shoes").doc(shoesList[index].id).update({
                                                                                        "quantity": cart_notify.quant_rec(shoesList[index].id)
                                                                                      });
                                                                                      length++;
                                                                                    },
                                                                                    child: const Icon(
                                                                                      AntDesign.plussquare,
                                                                                      size: 20,
                                                                                      color: Colors.black,
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
                                                              ],
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                );
                                              });
                                });
                        }
                      }),
                ),
                check
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: checkButton(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => paymenTpage(
                                          orderedShoes: checkout_shoes,
                                          quant: checkout_quant)));
                            },
                            label: "Proceed to CheckOut"),
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void doNothing() {}
