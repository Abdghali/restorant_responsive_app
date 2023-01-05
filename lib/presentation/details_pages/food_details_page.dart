import 'package:flutter/material.dart';
import '../../data/models/food_item.dart';
import '../responsive_layout.dart';
import 'details_desktop_page.dart';
import 'details_mobile_page.dart';
import 'details_tablet_page.dart';

class FoodDetailsPage extends StatelessWidget {
  final FoodItem foodItem;
  const FoodDetailsPage({Key? key, required this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: FoodDetailsMobilePage(
        foodItem: foodItem,
      ),
      tabletBody: FoodDetailsTabletPage(
        foodItem: foodItem,
      ),
      desktopBody: FoodDetailsDesktopPage(
        foodItem: foodItem,
      ),
    );
  }
}
