import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/productBYcat.dart';
import 'package:ecommerce/views/productpage.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:ecommerce/views/shared/productcart.dart';
import 'package:flutter/material.dart';

class homeShoe extends StatefulWidget {
  homeShoe({super.key, required this.userShoe,required this.tabindex});

  late Future<List<Sneakers>> userShoe;
  int tabindex;

  @override
  State<homeShoe> createState() => _homeShoeState();
}

class _homeShoeState extends State<homeShoe> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // mens shoes
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.405,
              child: FutureBuilder<List<Sneakers>>(
                future: widget.userShoe,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print(" Error ${snapshot.error}");

                    return Text(" Error ${snapshot.error}");
                  } else {
                    final userShoe = snapshot.data;
                    return ListView.builder(
                      itemCount: userShoe!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => productPage(id: shoe.id, category: shoe.category)));
                          },
                          child: productCard(
                              categogry: shoe.category,
                              price: "\$${shoe.price}",
                              id: shoe.id,
                              name: shoe.name,
                              image: shoe.imageUrl[0]),
                        );
                      },
                    );
                  }
                },
              )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Shoes",
                      style: appstyle(24, Colors.black, FontWeight.bold),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>productByCat(index: widget.tabindex)));
                          },
                          child: Text(
                            "Show All ",
                            style: appstyle(22, Colors.black, FontWeight.w500),
                          ),
                        ),
                        // Icon(Icons.c)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
              // second list builder
              height: MediaQuery.of(context).size.height * 0.13,
              child: FutureBuilder<List<Sneakers>>(
                future: widget.userShoe,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    print(" Error ${snapshot.error}");

                    return Text(" Error ${snapshot.error}");
                  } else {
                    final user = snapshot.data;
                    return ListView.builder(
                      itemCount: user!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        spreadRadius:
                                            1, // used to spread radius of box shadow
                                        blurRadius: 0.8,
                                        offset: Offset(0, 1))
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.28,
                              child: CachedNetworkImage(
                                  imageUrl: shoe.imageUrl[1])),
                        );
                      },
                    );
                  }
                },
              )),
        ]);
  }
}
