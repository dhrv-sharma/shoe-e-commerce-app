import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/services/helper.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:ecommerce/views/shared/shoesdisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  late final TabController tabController = TabController(
      length: 3, vsync: this); // length is three because of three sections only

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kid;

  void getMale() {
    _male = helper().getMaleSneakers();
  }

  void getFemale() {
    _female = helper().getFemaleSneakers();
  }

  void getkid() {
    _kid = helper().getKidsSneakers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMale();
    getFemale();
    getkid();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // status bar color
    ));
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
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
                  padding: const EdgeInsets.only(left: 8, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Athletic Shoes",
                          style: appstyleHt(
                              42, Colors.white, FontWeight.bold, 1.5),
                        ),
                        Text(
                          "Collection",
                          style: appstyleHt(
                              42, Colors.white, FontWeight.bold, 1.2),
                        ),
                        TabBar(
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            controller: tabController,
                            isScrollable: true,
                            labelColor: Colors.white,
                            labelStyle:
                                appstyle(24, Colors.white, FontWeight.bold),
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
                    homeShoe(
                      userShoe: _male,
                      tabindex: 0,
                    ),
                    homeShoe(
                      userShoe: _female,
                      tabindex: 1,
                    ),
                    homeShoe(
                      userShoe: _kid,
                      tabindex: 2,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
