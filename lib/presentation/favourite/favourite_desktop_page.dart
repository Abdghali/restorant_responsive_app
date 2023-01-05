import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/presentation/widgets/empty_list.dart';
import '../../business_logic/favorite_page_controller.dart';
import '../../data/services/food_services.dart';
import '../../utility/constants.dart';
import '../../utility/my_app_color.dart';
import '../widgets/my_tile.dart';
import '../widgets/image_container.dart';
import '../widgets/slider.dart';
import 'widgets/favourite_row_item.dart';

class FavouriteDesktopPage extends StatelessWidget {
  FavoritePageController favoritePageController;
  FavouriteDesktopPage({Key? key, required this.favoritePageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      appBar: myAppBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
            myDrawer,

            // first half of page
            Expanded(
              flex: 2,
              child: Obx(
                () => Visibility(
                  replacement: EmptyList(),
                  visible:
                      favoritePageController.listOfFavoriteFoodItem.length > 0,
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
            // second half of page
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageContainer(
                        imageUrl:
                            'https://images.pexels.com/photos/776538/pexels-photo-776538.jpeg?auto=compress&cs=tinysrgb&w=1600'),
                  ),
                  // list of stuff
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SliderImages(
                        images: const [
                          'https://images.pexels.com/photos/262918/pexels-photo-262918.jpeg?auto=compress&cs=tinysrgb&w=1600',
                          'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&w=1600'
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
