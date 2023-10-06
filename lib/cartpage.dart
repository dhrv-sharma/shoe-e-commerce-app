import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/views/cart.dart';
import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  List<Sneakers> shoesList = [
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
  ];
  @override
  Widget build(BuildContext context) {
    // in this page we will extract the data from the flutter in mycart dection which will return list of ids and from ids we will extract the data from json file
    return Scaffold(
      body: Center(
        child: CartPage(shoesList: shoesList),
      ),
    );
  }
}
