import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controllers/product_providers.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/services/helper.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class productPage extends StatefulWidget {
  const productPage({super.key, required this.id, required this.category});

  final String id;
  final String category;

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  final PageController _pageController = new PageController();

  late Future<Sneakers> _sneakers;
  void getshoes() {
    if (widget.category == "Men's Running") {
      _sneakers = helper().getMaleSneakersById(widget.id);
    } else if (widget.category == "Women's Running") {
      _sneakers = helper().getFemaleSneakersById(widget.id);
    } else {
      _sneakers = helper().getKidsSneakersById(widget.id);
    }
  }

  @override
  void initState() {
    super.initState();
    getshoes();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade300, // status bar color
    ));
    return FutureBuilder<Sneakers>(
        future: _sneakers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print(" Error ${snapshot.error}");

            return Text(" Error ${snapshot.error}");
          } else {
            final userShoe = snapshot.data;
            return SafeArea(
              child: Scaffold(body: Consumer<ProductNotifiers>(
                builder: (context, productNotifiers, child) {
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        leadingWidth: 0,
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  productNotifiers.shoeSizes.clear();
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: null,
                                child: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        pinned: true,
                        snap: false,
                        floating: true,
                        backgroundColor: Colors.transparent,
                        expandedHeight:
                            MediaQuery.of(context).size.height * 0.90,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.8, // it means 50 porcent of the height of the phone
                                width: MediaQuery.of(context).size.width,
                                child: PageView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: userShoe!.imageUrl.length,
                                    controller: _pageController,
                                    onPageChanged: (page) {
                                      // thats why we use PrdouctNotifier statemangement
                                      productNotifiers.activepage = page;
                                    },
                                    itemBuilder: (context, int index) {
                                      return Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.39,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.grey.shade300,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  userShoe.imageUrl[index],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Positioned(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              right: 16,
                                              child: const Icon(
                                                Icons.favorite_border_sharp,
                                                color: Colors.grey,
                                              )),
                                          Positioned(
                                              top: 140,
                                              right:
                                                  0, // to get at the center it right and left should be zero
                                              left: 0,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List<Widget>.generate(
                                                    userShoe.imageUrl.length,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      4),
                                                          child: CircleAvatar(
                                                            radius: 5,
                                                            backgroundColor:
                                                                productNotifiers
                                                                            .activepage !=
                                                                        index
                                                                    ? Colors
                                                                        .grey
                                                                    : Colors
                                                                        .black,
                                                          ),
                                                        )),
                                              )),
                                        ],
                                      );
                                    }),
                              ),
                              Positioned(
                                  bottom: -70,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.645,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              userShoe.name,
                                              style: appstyle(40, Colors.black,
                                                  FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Text(userShoe.category,
                                                    style: appstyle(
                                                      20,
                                                      Colors.grey,
                                                      FontWeight.w500,
                                                    )),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 13),
                                                  child: RatingBar.builder(
                                                      initialRating: 3.5,
                                                      minRating: 1,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 22,
                                                      itemPadding:
                                                          const EdgeInsets
                                                              .symmetric(
                                                        horizontal: 1,
                                                      ),
                                                      itemBuilder: (context,
                                                              _) =>
                                                          const Icon(
                                                            Icons.star,
                                                            size: 18,
                                                            color: Colors.black,
                                                          ),
                                                      onRatingUpdate:
                                                          (rating) {}),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$${userShoe.price}",
                                                  style: appstyle(
                                                      26,
                                                      Colors.black,
                                                      FontWeight.w600),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Colors",
                                                      style: appstyle(
                                                          16,
                                                          Colors.black,
                                                          FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const CircleAvatar(
                                                      radius: 7,
                                                      backgroundColor:
                                                          Colors.red,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Select sizes",
                                                      style: appstyle(
                                                          20,
                                                          Colors.black,
                                                          FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      "View size guide",
                                                      style: appstyle(
                                                          20,
                                                          Colors.grey,
                                                          FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                  child: ListView.builder(
                                                      itemCount:
                                                          productNotifiers
                                                              .shoeSizes.length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      padding: EdgeInsets.zero,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final shoessize =
                                                            productNotifiers
                                                                .shoeSizes;
                                                        return Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8),
                                                          child: Center(
                                                            child: ChoiceChip(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 6,
                                                                      bottom:
                                                                          18),
                                                              shape:
                                                                  const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            2000)),
                                                              ),
                                                              disabledColor:
                                                                  Colors.white,
                                                              side: BorderSide(
                                                                  color: shoessize[
                                                                              index]
                                                                          [
                                                                          "isSelected"]
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .grey,
                                                                  width: 1,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                              label: Text(
                                                                shoessize[index]
                                                                    ["size"],
                                                                style: appstyle(
                                                                    18,
                                                                    shoessize[index]
                                                                            [
                                                                            "isSelected"]
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    FontWeight
                                                                        .w600),
                                                              ),
                                                              selectedColor:
                                                                  Colors.black,
                                                              selected: productNotifiers
                                                                          .shoeSizes[
                                                                      index][
                                                                  'isSelected'],
                                                              onSelected:
                                                                  (newsState) {
                                                                productNotifiers
                                                                    .toggleChecked(
                                                                        index);
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Text(
                                                    userShoe.title,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: appstyle(
                                                        24,
                                                        Colors.black,
                                                        FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(
                                      Icons.arrow_drop_up_rounded,
                                      size: 60,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  userShoe.description,
                                  textAlign: TextAlign.justify,
                                  style: appstyle(
                                      14, Colors.grey, FontWeight.normal),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Center(
                                          child: Text(
                                            "Add to Bag",
                                            style: appstyle(20, Colors.white,
                                                FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              )),
            );
          }
        });
  }
}
