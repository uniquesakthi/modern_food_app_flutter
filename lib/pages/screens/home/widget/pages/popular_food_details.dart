import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../../model/popular_food.dart';

class PopularFoodDetails extends StatefulWidget {
  final PopularFood itemDetails;
  const PopularFoodDetails({
    super.key,
    required this.itemDetails,
  });

  @override
  State<PopularFoodDetails> createState() => _PopularFoodDetailsState();
}

class _PopularFoodDetailsState extends State<PopularFoodDetails> {
  final pageController = PageController();
  double page = 0;
  PopularFood foodItem = PopularFood.popularFoodList.first;

  void onListener() {
    setState(() {
      page = pageController.page ?? 0;
    });
  }

  @override
  void initState() {
    pageController.addListener(onListener);

    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(onListener);
    pageController.dispose();
    super.dispose();
  }

  void animateTo(int page) {
    if (page < 0 || page > PopularFood.popularFoodList.length - 1) return;

    pageController.animateToPage(page.round(),
        duration: const Duration(milliseconds: 700), curve: Curves.elasticOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: ((_, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;
                final size = width * 0.5;

                return Stack(
                  children: [
                    Positioned(
                        top: -height / 2,
                        bottom: size / 2,
                        right: -height / 2,
                        left: -height / 2,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.3),
                              shape: BoxShape.circle),
                        )),
                    Listener(
                      onPointerUp: (context) {
                        animateTo(page.round());
                      },
                      child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: pageController,
                          itemCount: PopularFood.popularFoodList.length,
                          onPageChanged: (index) {
                            foodItem = PopularFood.popularFoodList[index];
                          },
                          itemBuilder: (context, index) {
                            final item = PopularFood.popularFoodList[index];
                            final percentage = page - index;
                            final opacity = 1.0 - percentage;
                            final radius = height - size / 1.2;
                            final x = radius * sin(percentage);
                            final y =
                                radius * cos(percentage) - height + size / 1.2;

                            return Opacity(
                              opacity:
                                  opacity < 0.3 ? 0.0 : opacity.clamp(0.0, 1.0),
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..translate(x, y)
                                  ..rotateZ(percentage),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    item.img,
                                    height: size,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                );
              }),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () => animateTo(page.round() - 1),
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.orange,
                        hoverColor: Colors.orange,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        foodItem.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () => animateTo(page.round() + 1),
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: Colors.orange,
                        hoverColor: Colors.orange,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
