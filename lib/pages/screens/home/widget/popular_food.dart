import 'package:flutter/material.dart';
import 'package:food_app_ui/model/popular_food.dart';

import 'pages/popular_food_details.dart';

class PopularFoodTile extends StatefulWidget {
  final PopularFood item;

  const PopularFoodTile({
    super.key,
    required this.item,
  });

  @override
  State<PopularFoodTile> createState() => _PopularFoodTileState();
}

class _PopularFoodTileState extends State<PopularFoodTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PopularFoodDetails(
                  itemDetails: widget.item,
                ),
              ));
        },
        child: Column(
          children: [
            Image.asset(
              widget.item.img,
              width: 50,
              height: 50,
            ),
            Text(widget.item.name),
          ],
        ),
      ),
    );
  }
}
