import 'package:ecommerce/cartpage.dart';
import 'package:ecommerce/controllers/mainscreen_providers.dart';
import 'package:ecommerce/favouratepage.dart';
import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/profilepage.dart';
import 'package:ecommerce/searchpage.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:ecommerce/views/shared/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<Sneakers>> _male;

  List<Widget> pageList = [
    homePage(),
    searchpage(),
    Favourates(
      favourateShoes: [
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "45",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "45",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "45",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "45",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "45",
            description: "o",
            title: "0")
      ],
    ),
    cartPage(
      shoesList: [
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "45",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "45",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "245",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "45",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Women's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "120",
            description: "o",
            title: "0"),
        Sneakers(
            id: "UltraBoost Shoes",
            name: "UltraBoost Shoes",
            category: "Men's Shoes",
            imageUrl: [
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
              "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp"
            ],
            oldPrice: "UltraBoost Shoes",
            sizes: ["6.0", "7.0", "8.0"],
            price: "145",
            description: "o",
            title: "0")
      ],
    ),
    profilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
        // setting up the provider for the state mangement process
        builder: (context, mainScreenNotifier, child) {
      // mainScreenNotifier is the object
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),

        body: pageList[mainScreenNotifier.pageIndex], // getting the variable
        bottomNavigationBar: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            // container take the size of its children
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset =
                        0; // setting the variable of the notifier hence automatically the notify listeners will get called
                  },
                  icon: mainScreenNotifier.pageIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset = 1;
                  },
                  icon: mainScreenNotifier.pageIndex != 1
                      ? Icons.manage_search_outlined
                      : Icons.search,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset = 2;
                  },
                  icon: mainScreenNotifier.pageIndex == 2
                      ? Ionicons.heart
                      : Icons.favorite_outline,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset = 3;
                  },
                  icon: mainScreenNotifier.pageIndex == 3
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                ),
                BottomNavWidget(
                  onTap: () {
                    mainScreenNotifier.pageset = 4;
                  },
                  icon: mainScreenNotifier.pageIndex == 4
                      ? Icons.person_2
                      : Icons.person_2_outlined,
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
