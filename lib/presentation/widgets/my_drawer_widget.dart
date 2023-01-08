import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../utility/constants.dart';
import '../../utility/my_app_color.dart';
import '../../utility/my_app_style.dart';
import '../cart_pages/cart_page.dart';
import '../favourite/favourite_page.dart';
import '../home/home_page.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      elevation: 0,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.favorite,
              size: 64,
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: MyAppColors.PrimaryColor,
              ),
              onTap: (() {
                Get.to(HomePage());
                Logger().e(Get.currentRoute);
              }),
              title: Text(
                'home'.tr,
                style:
                    Get.currentRoute == "/" || Get.currentRoute == "/HomePage"
                        ? MyAppStyle.sctivedrawerTextColor
                        : MyAppStyle.deActivedrawerTextColor,
              ),
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: MyAppColors.PrimaryColor,
              ),
              onTap: (() {
                Logger().e(Get.currentRoute);
                Get.to(FavouritePage());
              }),
              title: Text(
                'favorite'.tr,
                style: Get.currentRoute == "/FavouritePage"
                    ? MyAppStyle.sctivedrawerTextColor
                    : MyAppStyle.deActivedrawerTextColor,
              ),
            ),
          ),
          Padding(
            padding: tilePadding,
            child: ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: MyAppColors.PrimaryColor,
              ),
              onTap: (() {
                Logger().e(Get.currentRoute);

                Get.to(CartPage());
              }),
              title: Text(
                'cart'.tr,
                style: Get.currentRoute == "/CartPage"
                    ? MyAppStyle.sctivedrawerTextColor
                    : MyAppStyle.deActivedrawerTextColor,
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
