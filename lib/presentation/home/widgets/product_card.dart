import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/presentation/home/widgets/rading_stars.dart';
import 'package:restaurant_app/utility/my_app_color.dart';
import '../../../business_logic/cart_page_controller.dart';
import '../../../business_logic/favorite_page_controller.dart';
import '../../../data/models/food_item.dart';
import '../../../utility/my_app_style.dart';
import '../../details_pages/food_details_page.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem foodItem;
  FoodItemCard({Key? key, required this.foodItem}) : super(key: key);
  CartPageController cartPageController = Get.find();
  FavoritePageController favoritePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          Get.to(FoodDetailsPage(
            foodItem: foodItem,
            previousRouteName: Get.currentRoute,
          ));
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          foodItem.imageUrl!,
                        ),
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          foodItem.name!,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 7.w,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: RatingStars(
                                rating: foodItem.rating!,
                              ),
                            ),
                            Expanded(
                              child: AutoSizeText(
                                foodItem.rating!.toString(),
                                style: MyAppStyle.cardRatingTextStyle.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 5.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await cartPageController
                                    .setFoodItemtoCart(foodItem);
                              },
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: MyAppColors.PrimaryColor,
                                size: 10.w,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AutoSizeText(
                                  foodItem.price.toString(),
                                  style: MyAppStyle.priceTextStyle.copyWith(
                                    fontSize: 6.w,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                AutoSizeText(
                                  'USD',
                                  style: MyAppStyle.priceTextStyle.copyWith(
                                    fontSize: 6.w,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 2.h,
        right: 2.w,
        child: SizedBox(
          height: 30.h,
          width: 30.h,
          child: FloatingActionButton(
            heroTag: "like",
            backgroundColor: MyAppColors.PrimaryColor,
            child: Icon(
              CupertinoIcons.heart,
              size: 20.h,
              // color: Colors.white,
            ),
            onPressed: () {
              print('add to favorites________________________');
              favoritePageController.setFoodItemToFavorite(foodItem);
            },
          ),
        ),
      ),
    ]);
  }
}
