import 'package:ecommerce/model/productcart.dart';
import 'package:ecommerce/staggeredtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class allproduct extends StatefulWidget {
  allproduct({super.key, required this.male});

  late Future<List<Sneakers>> male;

  @override
  State<allproduct> createState() => _allproductState();
}

class _allproductState extends State<allproduct> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: widget.male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          print(" Error ${snapshot.error}");

          return Text(" Error ${snapshot.error}");
        } else {
          final userShoe = snapshot.data;
//               staggeredTileBuilder: This parameter defines how each item in the grid should be sized. It takes an index as an argument and returns a StaggeredTile object that defines the size of the item at that index. In your code:

// If the index is even (index % 2 == 0), the width of the item is 1.
// If the index is 1 or 3 modulo 4 (index % 4 == 1 || index % 4 == 3), the height of the item is set to 35% of the screen height; otherwise, it's set to 30% of the screen height.
          return StaggeredGridView.countBuilder(
            padding:const  EdgeInsets.all(5), // used to give padding for different fragments in the screen
            crossAxisCount: 2, // horiozontally we can have two items
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            itemCount: userShoe!.length,
            scrollDirection: Axis.vertical,
            staggeredTileBuilder: (index) => StaggeredTile.extent(
                (index % 2 == 0) ? 1 : 1,
                (index % 4 == 1 || index % 4 == 3)
                    ? MediaQuery.of(context).size.height * 0.35
                    : MediaQuery.of(context).size.height * 0.3),
            itemBuilder: (context, index) {
              final Sneakers shoe = snapshot.data![index];
              return Staggeredtile(shoes: shoe);
            },
          );
        }
      },
    );
  }
}
