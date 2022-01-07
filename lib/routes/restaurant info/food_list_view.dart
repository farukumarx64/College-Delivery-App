import 'package:flutter/material.dart';

class FoodListView extends StatelessWidget {
  final PageController pageController;
  final int selected;
  final Function callback;
  final restaurantName,
      restaurantListIndex,
      restaurantImage,
      barColor,
      restaurantDetail,
      otherColor;

  FoodListView(
      this.pageController,
      this.selected,
      this.callback,
      this.restaurantDetail,
      this.restaurantListIndex,
      this.restaurantName,
      this.restaurantImage,
      this.otherColor,
      this.barColor);

  @override
  Widget build(BuildContext context) {
    final category = restaurantName[restaurantListIndex];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: [

        ],
      ),
    );
  }
}
