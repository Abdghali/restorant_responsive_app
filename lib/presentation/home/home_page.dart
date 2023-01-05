import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';

import '../../business_logic/home_page_controller copy 2.dart';
import '../responsive_layout.dart';
import '../widgets/no_internet_widget.dart';
import '../widgets/progress_indicator.dart';
import 'home_desktop_page.dart';
import 'home_mobile_page.dart';
import 'home_tablet_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
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
          HomePageController homePageController = Get.find();

          return Obx(() => Visibility(
              replacement: const MyProgressIndicator(),
              visible: homePageController.loading.value == false,
              child: ResponsiveLayout(
                mobileBody: HomeMobilePage(
                  homePageController: homePageController,
                ),
                tabletBody: HomeTabletPage(
                  homePageController: homePageController,
                ),
                desktopBody: HomeDesktopPage(
                  homePageController: homePageController,
                ),
              )));
        } else {
          return const NoInternetWidget();
        }
      },
      child: const MyProgressIndicator(),
    );
  }
}
