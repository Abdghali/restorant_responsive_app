import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import '../../business_logic/favorite_page_controller.dart';
import '../responsive_layout.dart';
import '../widgets/no_internet_widget.dart';
import '../widgets/progress_indicator.dart';
import 'favourite_desktop_page.dart';
import 'favourite_mobile_page.dart';
import 'favourite_tablet_page.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({Key? key}) : super(key: key);
  FavoritePageController favoritePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          FavoritePageController favoritePageController = Get.find();

          return Obx(
            () => Visibility(
              replacement: const MyProgressIndicator(),
              visible: favoritePageController.loading.value == false,
              child: ResponsiveLayout(
                mobileBody: FavouriteMobilePage(
                  favoritePageController: favoritePageController,
                ),
                tabletBody: FavouriteTabletPage(
                  favoritePageController: favoritePageController,
                ),
                desktopBody: FavouriteDesktopPage(
                  favoritePageController: favoritePageController,
                ),
              ),
            ),
          );
        } else {
          return const NoInternetWidget();
        }
      },
      child: const MyProgressIndicator(),
    );
  }
}
