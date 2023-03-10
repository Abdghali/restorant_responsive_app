import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../business_logic/cart_page_controller.dart';
import '../../business_logic/counter_getx_controller.dart';
import '../../business_logic/details_page_controller.dart';
import '../../business_logic/favorite_page_controller.dart';
import '../../data/models/food_item.dart';
import '../../data/services/food_services.dart';
import '../../utility/my_app_color.dart';
import '../../utility/my_app_style.dart';
import '../widgets/counter.dart';

class FoodDetailsTabletPage extends StatelessWidget {
  final FoodItem foodItem;
  DetailsPageController detailsPageController;
  FoodDetailsTabletPage(
      {Key? key, required this.foodItem, required this.detailsPageController})
      : super(key: key);
  CartPageController cartPageController = Get.find();
  CounterController counterController = Get.find();
  FavoritePageController favoritePageController =
      Get.put(FavoritePageController());
  @override
  Widget build(BuildContext context) {
    counterController.counter.value = foodItem.quantity ?? 0;

    return Scaffold(
      body: Obx(
        () => Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.0, color: MyAppColors.gray),
                      image: DecorationImage(
                          image: NetworkImage(
                            foodItem.imageUrl!,
                          ),
                          fit: BoxFit.cover)),
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            foodItem.name!,
                            style: MyAppStyle.boldTitleTextStyle
                                .copyWith(fontSize: 25.sp),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '\$' + foodItem.price.toString(),
                            style: MyAppStyle.cardTitleTextStyle
                                .copyWith(fontSize: 25.sp, color: Colors.green),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Description:',
                          style: MyAppStyle.cardTitleTextStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                        AutoSizeText(
                          foodItem.description!,
                          //  style: CupertinoTheme.of(context).textTheme.textStyle,
                          maxLines: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CounterWidget(
                      counterController: counterController,
                      width: 90.h,
                      height: 40.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
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
                        minimumSize: Size(330.w, 60.sp),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                            width: 1, color: MyAppColors.PrimaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(330.w, 60.sp),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                            width: 1, color: MyAppColors.PrimaryColor),
                      ),
                      onPressed: () {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
