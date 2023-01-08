import 'package:flutter/material.dart';
import 'package:restaurant_app/business_logic/details_page_controller.dart';
import '../../data/models/food_item.dart';
import '../responsive_layout.dart';
import 'details_desktop_page.dart';
import 'details_mobile_page.dart';
import 'details_tablet_page.dart';
import 'package:get/get.dart';

class FoodDetailsPage extends StatelessWidget {
  final FoodItem foodItem;
  final String previousRouteName;

  FoodDetailsPage(
      {Key? key, required this.foodItem, required this.previousRouteName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: FoodDetailsMobilePage(
        foodItem: foodItem,
        previousRouteName: previousRouteName,
      ),
      tabletBody: FoodDetailsTabletPage(
        foodItem: foodItem,
        previousRouteName: previousRouteName,
      ),
      desktopBody: FoodDetailsDesktopPage(
        foodItem: foodItem,
        previousRouteName: previousRouteName,
      ),
    );
  }
}
