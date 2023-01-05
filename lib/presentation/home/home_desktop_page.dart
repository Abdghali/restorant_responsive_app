import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/data/services/food_services.dart';
import 'package:restaurant_app/presentation/widgets/image_container.dart';
import 'package:restaurant_app/presentation/home/widgets/product_card.dart';
import 'package:restaurant_app/presentation/widgets/slider.dart';
import '../../business_logic/home_page_controller copy 2.dart';
import '../../utility/constants.dart';
import '../../utility/my_app_color.dart';
import '../widgets/empty_list.dart';
import '../widgets/my_box.dart';
import '../widgets/my_tile.dart';

class HomeDesktopPage extends StatelessWidget {
  HomePageController homePageController;

  HomeDesktopPage({Key? key, required this.homePageController})
      : super(key: key);

// // build appBar action
//   List<Widget> buildAppBarActions() {
//     if (homePageController.isSearching.value) {
//       return [
//         IconButton(
//           onPressed: () {
//             homePageController.isSearching.value = true;

//             //  homePageController.clearSearch();
//             Logger().e(homePageController.isSearching.value);
//             Get.back();
//           },
//           icon: Icon(Icons.clear, color: MyAppColors.myGrey),
//         ),
//       ];
//     } else {
//       return [
//         IconButton(
//           onPressed: () {
//             homePageController.isSearching.value = true;
//           },
//           icon: Icon(
//             Icons.search,
//             color: MyAppColors.myGrey,
//           ),
//         ),
//       ];
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      // appBar: AppBar(
      //   // backgroundColor: MyAppColors.myYallow,
      //   // leading: homePageController.isSearching.value
      //   //     ? BackButton(
      //   //         color: MyAppColors.myGrey,
      //   //       )
      //   //     : Container(),
      //   title: homePageController.isSearching.value
      //       ? homePageController.buildSearchField()
      //       : homePageController.buildAppBarTitle(),
      //   actions: buildAppBarActions(),
      // ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            myDrawer,
            // first half of page
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: ScreenUtil().screenHeight,
                child: Obx(() => Visibility(
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
                              foodItem:
                                  homePageController.listOfFoodItem[index],
                            ),
                          );
                        },
                      ),
                    )),
              ),
            ),
            // second half of page
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageContainer(
                        imageUrl:
                            'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg'),
                  ),
                  // list of stuff
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SliderImages(
                        images: const [
                          'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1600',
                          'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg?auto=compress&cs=tinysrgb&w=1600'
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
