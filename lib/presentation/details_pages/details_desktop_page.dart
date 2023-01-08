import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/business_logic/counter_getx_controller.dart';
import 'package:restaurant_app/data/services/food_services.dart';
import 'package:restaurant_app/utility/my_app_color.dart';
import 'package:restaurant_app/utility/my_app_style.dart';

import '../../business_logic/cart_page_controller.dart';
import '../../business_logic/details_page_controller.dart';
import '../../business_logic/favorite_page_controller.dart';
import '../../data/models/food_item.dart';
import '../widgets/counter.dart';
import '../widgets/image_container.dart';

class FoodDetailsDesktopPage extends StatelessWidget {
  final FoodItem foodItem;
  final String previousRouteName;
  DetailsPageController detailsPageController;

  FoodDetailsDesktopPage(
      {Key? key,
      required this.foodItem,
      required this.previousRouteName,
      required this.detailsPageController})
      : super(key: key);

  CartPageController cartPageController = Get.find();
  CounterController counterController = Get.find();
  FavoritePageController favoritePageController =
      Get.put(FavoritePageController());

  @override
  Widget build(BuildContext context) {
    counterController.counter.value = foodItem.quantity ?? 0;
    return Scaffold(
        body: Obx(() => Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      // color: Colors.amber,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ImageContainer(
                                    imageUrl: foodItem.imageUrl!,
                                    width: 100.w,
                                    height: 90.w,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText("price".tr,
                                          style: MyAppStyle.boldTitleTextStyle
                                              .copyWith(fontSize: 80.sp)),
                                      AutoSizeText(
                                          "${foodItem.price.toString()}}\$",
                                          style: MyAppStyle.priceTextStyle
                                              .copyWith(fontSize: 30.sp)),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                      AutoSizeText("quantity".tr,
                                          style: MyAppStyle.boldTitleTextStyle
                                              .copyWith(fontSize: 80.sp)),
                                      CounterWidget(
                                        counterController: counterController,
                                        width: 40.sp,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                AutoSizeText(foodItem.name!,
                                    style: MyAppStyle.boldTitleTextStyle
                                        .copyWith(fontWeight: FontWeight.w800)),
                                SizedBox(
                                  height: 10.h,
                                ),
                                AutoSizeText("description".tr,
                                    style: MyAppStyle.boldTitleTextStyle
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp)),
                                AutoSizeText(
                                  foodItem.description!,
                                  style: MyAppStyle.cardTitleTextStyle
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                  VerticalDivider(
                    endIndent: 200.h,
                    indent: 120.h,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () async {
                            detailsPageController
                                .setCartItem(counterController.counter.value);
                            Logger().e(previousRouteName);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: MyAppColors.PrimaryColor,
                          ),
                          label: Text(
                            !detailsPageController.isCartItem.value
                                ? 'add_to_cart'.tr
                                : "Update",
                            style: TextStyle(color: MyAppColors.PrimaryColor),
                          ),
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(180.sp, 60.sp),
                            shape: const StadiumBorder(),
                            side: const BorderSide(
                                width: 1, color: MyAppColors.PrimaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(180.sp, 60.sp),
                            shape: const StadiumBorder(),
                            side: const BorderSide(
                                width: 1, color: MyAppColors.PrimaryColor),
                          ),
                          onPressed: () async {
                            detailsPageController.setFavoriteItem(
                                counterController.counter.value);
                          },
                          icon: const Icon(
                            Icons.favorite_border_outlined,
                            color: MyAppColors.PrimaryColor,
                          ),
                          label: Text(
                            !detailsPageController.isFavoriteItem.value
                                ? 'add_to_favotits'.tr
                                : " Update",
                            style: TextStyle(color: MyAppColors.PrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
