import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  MealItemTrait({super.key, required this.icon, required this.lable});

  final IconData icon;
  final String lable;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.white,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          lable,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
