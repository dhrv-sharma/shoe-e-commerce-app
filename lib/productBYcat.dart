import 'package:ecommerce/allproductview.dart';
import 'package:ecommerce/cartpage.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/profilepage.dart';
import 'package:ecommerce/searchpage.dart';
import 'package:ecommerce/services/helper.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:ecommerce/views/shared/category_btn.dart';
import 'package:ecommerce/views/shared/custom_spacer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class productByCat extends StatefulWidget {
  const productByCat({super.key, required this.index});

  final int index;

  @override
  State<productByCat> createState() => _productByCatState();
}

class _productByCatState extends State<productByCat>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 3, vsync: this, initialIndex: widget.index);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kid;

  double _value = 100;

  List<String> brand = [
    "images/adidas.png",
    "images/gucci.png",
    "images/jordan.png",
    "images/nike.png",
  ];

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

  List<Widget> pageList = const [
    homePage(),
    searchpage(),
    homePage(),
    cartPage(),
    profilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  filter();
                                },
                                child: const Icon(
                                  FontAwesomeIcons.sliders,
                                  color: Colors.white,
                                ),
                              ),
                            ]),
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
                          ])
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.17,
                    left: 16,
                    right: 12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(
                      16)), // when you scroll it gives sharp edges so we give Circullar edge by this
                  child: TabBarView(controller: tabController, children: [
                    allproduct(male: _male),
                    allproduct(male: _female),
                    allproduct(male: _kid),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    // a drawer which will come from the down side
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        context: context,
        builder: ((context) => Container(
              height: MediaQuery.of(context).size.height * 0.84,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black38),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        const CustomeSpacer(),
                        Text(
                          "Filter",
                          style: appstyle(40, Colors.black, FontWeight.bold),
                        ),
                        const CustomeSpacer(),
                        Text(
                          "Gender",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Categorybtn(
                                buttonclr: Colors.black,
                                label: "Men",
                                onPress: () {}),
                            Categorybtn(
                                buttonclr: Colors.grey,
                                label: "Women",
                                onPress: () {}),
                            Categorybtn(
                                buttonclr: Colors.grey,
                                label: "Kids",
                                onPress: () {}),
                          ],
                        ),
                        const CustomeSpacer(),
                        Text(
                          "Data",
                          style: appstyle(20, Colors.black, FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Categorybtn(
                                buttonclr: Colors.black,
                                label: "Shoes",
                                onPress: () {}),
                            Categorybtn(
                                buttonclr: Colors.grey,
                                label: "Apparrels",
                                onPress: () {}),
                            Categorybtn(
                                buttonclr: Colors.grey,
                                label: "Others",
                                onPress: () {}),
                          ],
                        ),
                        const CustomeSpacer(),
                        Text(
                          "Price",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        const CustomeSpacer(),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor:
                                Colors.black, // Color for divisions
                            inactiveTrackColor: Colors.grey,
                            inactiveTickMarkColor: Colors.grey,
                            activeTickMarkColor: Colors.black,
                            thumbColor: Colors.black,
                            overlayColor: Colors.black.withAlpha(
                                32), // Optional: Color when thumb is pressed
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20.0),
                          ),
                          child: Slider(
                            value: _value,
                            onChanged: (double value) {},
                            max: 500, // 500 dollars
                            divisions: 50,
                            label: _value.toString(),
                            secondaryActiveColor:
                                Colors.grey, // Color for the secondary track
                          ),
                        ),
                        const CustomeSpacer(),
                        Text(
                          "Brand",
                          style: appstyle(20, Colors.black, FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: 80,
                          child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: Image.asset(
                                        brand[index],
                                        height: 60,
                                        width: 80,
                                      )),
                                );
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
