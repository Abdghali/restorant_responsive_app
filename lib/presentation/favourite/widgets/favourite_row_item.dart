import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/business_logic/favorite_page_controller.dart';
import 'package:restaurant_app/utility/my_app_color.dart';

import '../../../business_logic/cart_page_controller.dart';
import '../../../data/models/food_item.dart';
import '../../details_pages/food_details_page.dart';

class FavouriteRowItem extends StatelessWidget {
  final FoodItem foodItem;
  FavoritePageController favoritePageController;
  FavouriteRowItem(
      {Key? key, required this.foodItem, required this.favoritePageController})
      : super(key: key);
  CartPageController cartPageController = Get.find();
  // FavoritePageController favoritePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          FoodDetailsPage(
            foodItem: foodItem,
            previousRouteName: Get.currentRoute,
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin:
                  const EdgeInsets.only(left: 4, right: 8, top: 4, bottom: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(foodItem.imageUrl!),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  foodItem.name!,
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  '\$${foodItem.price}',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                          color: CupertinoColors.inactiveGray, fontSize: 14.sp),
                ),
              ],
            ),
          ),
          // const Spacer(),
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.heart_solid,
                      size: 20.h,
                      color: MyAppColors.PrimaryColor,
                    ),
                    onPressed: () async {
                      await favoritePageController
                          .deleteFoodItemFromFavorite(foodItem.id!);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.cart_badge_plus,
                      size: 20.h,
                      color: Colors.amber,
                    ),
                    onPressed: () async {
                      await cartPageController.setFoodItemtoCart(foodItem);

                      ///TODO add toast
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
