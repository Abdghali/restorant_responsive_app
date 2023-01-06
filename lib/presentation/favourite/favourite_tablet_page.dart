import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/presentation/favourite/widgets/favourite_row_item.dart';

import '../../business_logic/favorite_page_controller.dart';
import '../../data/services/food_services.dart';
import '../../utility/constants.dart';
import '../../utility/my_app_color.dart';
import '../widgets/empty_list.dart';
import '../widgets/my_tile.dart';

class FavouriteTabletPage extends StatelessWidget {
  FavoritePageController favoritePageController;
  FavouriteTabletPage({Key? key, required this.favoritePageController})
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
                () => Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Center(
                          child: favoritePageController.buildSearchField(),
                        )),
                    Expanded(
                      flex: 10,
                      child: Visibility(
                        replacement: EmptyList(),
                        visible: favoritePageController.isSearching.value
                            ? favoritePageController
                                .searchListOfFavorite.isNotEmpty
                            : favoritePageController
                                .listOfFavoriteFoodItem.isNotEmpty,
                        child: ListView.builder(
                          itemCount: favoritePageController.isSearching.value
                              ? favoritePageController
                                  .searchListOfFavorite.length
                              : favoritePageController
                                  .listOfFavoriteFoodItem.length,
                          itemBuilder: (context, index) {
                            return MyTile(
                              child: FavouriteRowItem(
                                foodItem:
                                    favoritePageController.isSearching.value
                                        ? favoritePageController
                                            .searchListOfFavorite[index]
                                        : favoritePageController
                                            .listOfFavoriteFoodItem[index],
                                favoritePageController: favoritePageController,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
