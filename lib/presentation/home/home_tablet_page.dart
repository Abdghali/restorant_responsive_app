import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/presentation/home/widgets/product_card.dart';
import 'package:restaurant_app/utility/my_app_color.dart';

import '../../business_logic/home_page_controller copy 2.dart';
import '../../data/services/food_services.dart';
import '../../utility/constants.dart';
import '../widgets/empty_list.dart';
import '../widgets/my_box.dart';
import '../widgets/my_tile.dart';

class HomeTabletPage extends StatelessWidget {
  HomePageController homePageController;

  HomeTabletPage({Key? key, required this.homePageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // first 4 boxes in grid
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: ScreenUtil().screenHeight,
                child: Obx(
                  () => Visibility(
                    replacement: const EmptyList(),
                    visible: homePageController.listOfFoodItem.length > 0,
                    child: GridView.builder(
                      itemCount: homePageController.listOfFoodItem.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return MyBox(
                          child: FoodItemCard(
                            foodItem: homePageController.listOfFoodItem[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            // // list of previous days
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 6,
            //     itemBuilder: (context, index) {
            //       return const MyTile();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
