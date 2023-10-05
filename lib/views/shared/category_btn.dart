import 'package:ecommerce/views/shared/appstyle.dart';
import 'package:flutter/material.dart';

class Categorybtn extends StatelessWidget {
  Categorybtn(
      {super.key,
      required this.buttonclr,
      required this.label,
      required this.onPress});

  final Color buttonclr;
  final String label;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: buttonclr, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            label,
            style: appstyle(20, buttonclr, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
