import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Favourates extends StatefulWidget {
  const Favourates({super.key, required this.favourateShoes});

  final List<Sneakers> favourateShoes;

  @override
  State<Favourates> createState() => _FavouratesState();
}

class _FavouratesState extends State<Favourates> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // status bar color
    ));
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/top.png"), fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "My Favourites",
                  style: appstyle(36, Colors.white, FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                child: ListView.builder(
                    itemCount: widget.favourateShoes.length,
                    padding: const EdgeInsets.only(top: 100),
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.11,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: const Offset(0, 1))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: CachedNetworkImage(
                                        imageUrl: widget
                                            .favourateShoes[index].imageUrl[0],
                                        height: 70,
                                        width: 70,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.favourateShoes[index].name,
                                            style: appstyle(16, Colors.black,
                                                FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            widget
                                                .favourateShoes[index].category,
                                            style: appstyle(14, Colors.grey,
                                                FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$${widget.favourateShoes[index].price}",
                                                style: appstyle(
                                                    18,
                                                    Colors.black,
                                                    FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: GestureDetector(
                                    child:
                                        const Icon(Ionicons.md_heart_dislike),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
