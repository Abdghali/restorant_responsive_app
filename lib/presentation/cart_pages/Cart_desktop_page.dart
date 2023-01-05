import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/presentation/cart_pages/widgets/%20price_summary_widget.dart';

import '../../business_logic/cart_page_controller.dart';
import '../../data/services/food_services.dart';
import '../../utility/constants.dart';
import '../../utility/my_app_color.dart';
import '../address_pages/address_page.dart';
import '../widgets/empty_list.dart';
import '../widgets/image_container.dart';
import '../widgets/slider.dart';
import 'widgets/cart_Item.dart';
import '../widgets/my_tile.dart';

class CartDesktopPage extends StatelessWidget {
  CartPageController cartPageController;
  CartDesktopPage({Key? key, required this.cartPageController})
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
              child: Obx(() => Visibility(
                    replacement: const EmptyList(),
                    visible: cartPageController.listOfCartFoodItems.length > 0,
                    child: ListView.builder(
                      itemCount: cartPageController.listOfCartFoodItems.length,
                      itemBuilder: (context, index) {
                        return MyTile(
                          child: CartItem(
                            foodItem:
                                cartPageController.listOfCartFoodItems[index],
                            cartPageController: cartPageController,
                          ),
                        );
                      },
                    ),
                  )),
            ),
            // second half of page
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ImageContainer(
                          imageUrl:
                              'https://images.pexels.com/photos/4935722/pexels-photo-4935722.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    ),
                  ),
                  // list of stuff
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PriceSummaryMobile_widget(
                          topBorderRadius: false,
                          callback: () {
                            Get.to(AddressPage());
                          },
                          buttonTitle: 'Next',
                          subtotalPrice:
                              '${cartPageController.subTotalPrice.value.toString()}',
                          taxPrice: '${tax}',
                          total:
                              '${cartPageController.totalPrice.value.toString()}'),
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
