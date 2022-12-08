import 'package:flutter/material.dart';
import 'package:food_app_ui/constants/size_config.dart';
import 'package:food_app_ui/model/food_item.dart';
import 'package:food_app_ui/model/popular_food.dart';
import 'package:food_app_ui/pages/screens/home/widget/popular_food.dart';
import '../../util/custom_app_bar.dart';
import 'home/widget/food_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * .02,
                ),
                const CustomAppBar(),
                SizedBox(
                  height: SizeConfig.screenHeight! * .04,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Search Food',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.filter_list),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .03,
                ),
                const Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Your Choices',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .05,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .23,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: FoodItem.foodList.length,
                      itemBuilder: (_, index) {
                        return FoodTile(
                          img: FoodItem.foodList[index].img,
                          name: FoodItem.foodList[index].name,
                          offer: FoodItem.foodList[index].offer,
                          color: FoodItem.foodList[index].color,
                          isOffer: FoodItem.foodList[index].isOffer,
                        );
                      }),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .05,
                ),
                const Text(
                  'Most Popular',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.11,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: PopularFood.popularFoodList.length,
                      itemBuilder: (_, index) {
                        return PopularFoodTile(
                          item: PopularFood.popularFoodList[index],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
