import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/top.png"), fit: BoxFit.fill),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 8, bottom: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Athletic Shoes",
                      style: appstyleHt(42, Colors.white, FontWeight.bold, 1.5),
                    ),
                    Text(
                      "Collection",
                      style: appstyleHt(42, Colors.white, FontWeight.bold, 1.2),
                    ),
                    TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        controller: tabController,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                        unselectedLabelColor: Colors.grey.withOpacity(0.3),
                        tabs: const [
                          Tab(
                            text: "Men Shoes",
                          ),
                          Tab(
                            text: "Women Shoes",
                          ),
                          Tab(
                            text: "Kids Shoes",
                          )
                        ]),
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.265),
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: TabBarView(controller: tabController, children: [
                Column(
                  // mens shoes
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.405,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.grey,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width*0.6,
                            ),
                          );
                        }),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12,20,20,20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest Shoes",
                                style:
                                    appstyle(24, Colors.black, FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Show All ",
                                    style: appstyle(
                                        22, Colors.black, FontWeight.w500),
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
                      height: MediaQuery.of(context).size.height * 0.13,
                      child:ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration:  const  BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius:1 ,
                                  blurRadius: 0.8,
                                  offset: Offset(0, 1)
                                )],
                                borderRadius: BorderRadius.all(Radius.circular(16))
                               ),
                              height: MediaQuery.of(context).size.height*0.12,
                              width: MediaQuery.of(context).size.width*0.28,
                              child: Image.asset("images/shoep.png",)
                            ),
                          );
                        }) ,
                    )
                  ],
                ),
                Column(
                  // womens shoes
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.405,
                      color: Colors.red,
                    )
                  ],
                ),
                Column(
                  // kids shoes
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.405,
                      color: Colors.green,
                    )
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
