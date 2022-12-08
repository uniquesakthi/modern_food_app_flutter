import 'package:flutter/material.dart';

class FoodItem {
  final String? img, name, offer;
  final Color? color;
  final bool? isOffer;

  FoodItem({
    required this.img,
    required this.name,
    required this.offer,
    required this.color,
    required this.isOffer,
  });

  static List<FoodItem> foodList = [
    FoodItem(
      img: 'images/burger1.png',
      name: 'Burger',
      offer: '5',
      color: Colors.orange.withOpacity(0.1),
      isOffer: true,
    ),
    FoodItem(
      img: 'images/pasta.png',
      name: 'Pasta',
      offer: '5',
      color: Colors.blue.withOpacity(0.1),
      isOffer: false,
    ),
    FoodItem(
      img: 'images/chicken.png',
      name: 'Chicken',
      offer: '10',
      color: Colors.purple.withOpacity(0.1),
      isOffer: true,
    ),
    FoodItem(
      img: 'images/burger1.png',
      name: 'Burger',
      offer: '15',
      color: Colors.orange.withOpacity(0.1),
      isOffer: false,
    ),
  ];
}
