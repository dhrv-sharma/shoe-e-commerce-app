import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class productCard extends StatefulWidget {
  const productCard(
      {super.key,
      required this.categogry,
      required this.price,
      required this.id,
      required this.name,
      required this.image});

  final String categogry;
  final String price;
  final String id;
  final String name;
  final String image;

  @override
  State<productCard> createState() => _productCardState();
}

class _productCardState extends State<productCard> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
              blurRadius: 0.6,
              offset: Offset(1, 1),
            )
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(widget.image))),
                  ),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.favorite_border_sharp),
                      )),
                  
                ],
              ),
              Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: appstyleHt(
                              30, Colors.black, FontWeight.bold, 1.1),
                        ),
                        Text(
                          widget.categogry,
                          style:
                              appstyleHt(18, Colors.grey, FontWeight.bold, 1.5),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8,),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.price,
                            style: appstyle(30, Colors.black, FontWeight.w600),
                          ),
                          Row(
                            children: [
                              Text(
                                "Colors",
                                style:
                                    appstyle(18, Colors.grey, FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              ChoiceChip(
                                label: Text(" "),
                                selected: selected,
                                visualDensity: VisualDensity.compact,
                                selectedColor: Colors.black,
                              )
                            ],
                          )
                        ]),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
