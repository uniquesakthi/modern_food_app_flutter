import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _drawerIcon(15),
            _drawerIcon(20),
            _drawerIcon(10),
          ],
        ),
        const Text(
          'Food',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset(
            'images/user.png',
            height: 30,
            width: 30,
          ),
        )
      ],
    );
  }

  _drawerIcon(double width) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: width,
        height: 3,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
