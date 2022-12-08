import 'package:flutter/material.dart';

import 'screens/category_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'screens/shop_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int selectedIndex = 0;
  final pages = const [
    HomeScreen(),
    SearchScreen(),
    CategoryScreen(),
    ShopScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.home,
                      color: selectedIndex == 0 ? Colors.orange : Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    icon: Icon(
                      Icons.search,
                      color: selectedIndex == 1 ? Colors.orange : Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    icon: Icon(
                      Icons.grid_view,
                      color: selectedIndex == 2 ? Colors.orange : Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      color: selectedIndex == 3 ? Colors.orange : Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = 4;
                      });
                    },
                    icon: Icon(
                      Icons.person,
                      color: selectedIndex == 4 ? Colors.orange : Colors.black,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
