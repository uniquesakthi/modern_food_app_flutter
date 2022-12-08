class PopularFood {
  final String img, name;

  PopularFood(
    this.img,
    this.name,
  );

  static List<PopularFood> popularFoodList = [
    PopularFood('images/steak.png', 'Steak'),
    PopularFood('images/burger1.png', 'Burger'),
    PopularFood('images/pasta.png', 'Pasta'),
    PopularFood('images/chicken.png', 'Chicken'),
    PopularFood('images/pizza.png', 'Pizza'),
    PopularFood('images/pasta.png', 'Pasta'),
  ];
}
