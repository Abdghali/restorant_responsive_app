import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:restaurant_app/presentation/favourite/widgets/favourite_row_item.dart';
import 'package:restaurant_app/presentation/widgets/empty_list.dart';

import '../../business_logic/favorite_page_controller.dart';
import '../../data/services/food_services.dart';
import '../../utility/constants.dart';
import '../../utility/my_app_color.dart';
import '../widgets/my_tile.dart';

class FavouriteMobilePage extends StatelessWidget {
  FavoritePageController favoritePageController;
  FavouriteMobilePage({Key? key, required this.favoritePageController})
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
            // list of previous days
            Expanded(
              child: Obx(
                () => Visibility(
                  visible:
                      favoritePageController.listOfFavoriteFoodItem.length > 0,
                  replacement: EmptyList(),
                  child: ListView.builder(
                    itemCount:
                        favoritePageController.listOfFavoriteFoodItem.length,
                    itemBuilder: (context, index) {
                      return MyTile(
                        child: FavouriteRowItem(
                          foodItem: favoritePageController
                              .listOfFavoriteFoodItem[index],
                          favoritePageController: favoritePageController,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
