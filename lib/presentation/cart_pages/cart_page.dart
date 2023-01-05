import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import '../../business_logic/cart_page_controller.dart';
import '../responsive_layout.dart';
import '../widgets/no_internet_widget.dart';
import '../widgets/progress_indicator.dart';
import 'Cart_desktop_page.dart';
import 'Cart_mobile_page.dart';
import 'Cart_tablet_page.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  // CartPageController cartPageController = Get.find();

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
          CartPageController cartPageController =
              Get.put(CartPageController(), permanent: true);

          return Obx(
            () => Visibility(
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              visible: cartPageController.loading.value == false,
              child: ResponsiveLayout(
                mobileBody: CartMobilePage(
                  cartPageController: cartPageController,
                ),
                tabletBody: CartTabletPage(
                  cartPageController: cartPageController,
                ),
                desktopBody: CartDesktopPage(
                  cartPageController: cartPageController,
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
