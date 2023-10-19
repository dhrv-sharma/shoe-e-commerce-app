import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/services/helper.dart';
import 'package:ecommerce/views/productpage.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:ecommerce/views/shared/customfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey.shade300,

      systemNavigationBarColor: Colors.black, // navigation bar color
      // status bar color
    ));
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.grey.shade300, // Navigation bar
            statusBarColor: Colors.black, // Status bar
          ),
          automaticallyImplyLeading: false, // back button get false here
          toolbarHeight: 100.h,
          backgroundColor: Colors.black,
          elevation: 0,
          title: CustomField(
            hintText: "Search for a product",
            controller: search,
            ts: TextInputAction.search,
            onEditingComplete: () {
              helper().getuserSearchedShoes(search.text);
              setState(() {});
            },
            prefixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(
                AntDesign.camera,
                color: Colors.black,
              ),
            ),
            suffixIcon: const Icon(
              AntDesign.search1,
              color: Colors.black,
            ),
          ),
        ),
        body: search.text.isEmpty
            ? Center(
                child: Container(
                  color: Colors.grey.shade300,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: Image.asset("images/pose.png"),
                  ),
                ),
              )
            : Container(
                child: FutureBuilder<List<Sneakers>>(
                    future: helper().getuserSearchedShoes(search.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (snapshot.hasError) {
                        return const Text("error");
                      } else if (snapshot.data!.isEmpty) {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.grey.shade300,
                          child: Center(
                              child: Text(
                            "No Product found",
                            style: appstyle(25, Colors.black, FontWeight.w700),
                          )),
                        );
                      } else {
                        final shoe = snapshot.data;
                        return Container(
                          color: Colors.grey.shade300,
                          child: ListView.builder(
                              itemCount: shoe!.length,
                              itemBuilder: (context, index) {
                                final current = shoe[index];
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator push ReNamed
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => productPage(
                                                id: current.id,
                                                category: current.category,
                                                shoesize: current.sizes)));
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.h),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        child: Container(
                                          height: 90.h,
                                          width: 325,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade500,
                                                    spreadRadius: 5,
                                                    blurRadius: 0.3,
                                                    offset: const Offset(0, 2))
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(12.h),
                                                child: CachedNetworkImage(
                                                  imageUrl: current.imageUrl[0],
                                                  width: 70.w,
                                                  height: 70.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 8.h, left: 20.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      current.name,
                                                      style: appstyle(
                                                          15,
                                                          Colors.black,
                                                          FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      current.category,
                                                      style: appstyle(
                                                          15,
                                                          Colors.grey.shade600,
                                                          FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "\$ ${current.price}",
                                                      style: appstyle(
                                                          15,
                                                          Colors.grey.shade600,
                                                          FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                    }),
              ));
  }
}
