import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;

  const BottomNavWidget({super.key, this.onTap, this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
          height: 36,
          width: 36,
          child: Icon(
            icon,
            color: Colors.white,
          )),
    );
  }
}
