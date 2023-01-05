import 'package:get/get.dart';

import '../cart_page_controller.dart';
import '../counter_getx_controller.dart';
import '../favorite_page_controller.dart';
import '../home_page_controller copy 2.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<CounterController>(() =>
        CounterController()); // different instances for different list items
    Get.create<HomePageController>(() =>
        HomePageController()); // different instances for different list items
    Get.create<FavoritePageController>(() =>
        FavoritePageController()); // different instances for different list items
    Get.create<CartPageController>(
      () => CartPageController(),
    ); // different instances for different list items

    // Get.put<CounterController>(CounterController(),
    //     tag: 'counter'); // seperate instance to display total
  }
}
