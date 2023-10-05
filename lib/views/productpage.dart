import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controllers/product_providers.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/services/helper.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ionicons/ionicons.dart';
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
    // TODO: implement initState
    super.initState();
    getshoes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Sneakers>(
        future: _sneakers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            print(" Error ${snapshot.error}");

            return Text(" Error ${snapshot.error}");
          } else {
            final userShoe = snapshot.data;
            return Scaffold(body: Consumer<ProductNotifiers>(
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
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: userShoe!.imageUrl.length,
                                  controller: _pageController,
                                  onPageChanged: (page) {
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.grey.shade300,
                                          child: CachedNetworkImage(
                                            imageUrl: userShoe.imageUrl[index],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            right: 16,
                                            child: const Icon(
                                              Icons.favorite_border_sharp,
                                              color: Colors.grey,
                                            )),
                                        Positioned(
                                            bottom: 0,
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
                                                  userShoe!.imageUrl.length,
                                                  (index) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 4),
                                                        child: CircleAvatar(
                                                          radius: 5,
                                                          backgroundColor:
                                                              productNotifiers
                                                                          .activepage !=
                                                                      index
                                                                  ? Colors.grey
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
                                bottom: 30,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
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
                                                margin:const  EdgeInsets.only(left: 13),
                                                child: RatingBar.builder(
                                                    initialRating: 3.5,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 22,
                                                    itemPadding:
                                                       const  EdgeInsets.symmetric(
                                                      horizontal: 1,
                                                    ),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                          Icons.star,
                                                          size: 18,
                                                          color: Colors.black,
                                                        ),
                                                    onRatingUpdate:
                                                        (rating){
                                              
                                                        }),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ));
          }
        });
  }
}
