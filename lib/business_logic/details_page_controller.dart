import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/data/models/food_item.dart';

import 'cart_page_controller.dart';
import 'counter_getx_controller.dart';
import 'favorite_page_controller.dart';

class DetailsPageController extends GetxController {
  RxBool isCartItem = false.obs; // is item in cart list
  RxBool isFavoriteItem = false.obs; // is item in Favorite list
  CartPageController cartPageController = Get.find();
  FavoritePageController favoritePageController = Get.find();

  Rx<FoodItem> myFoodItem =
      FoodItem(id: 0, name: ' ', imageUrl: ' ', price: 0).obs;

  updateFoodItem(FoodItem foodItem) {
    myFoodItem.value = foodItem;
    update();
    Logger().e("Logger food item ${myFoodItem.toJson()}");
  }

  setCartItem(int quantity) async {
    myFoodItem.value.quantity = quantity;
    // update the quantity
    !isCartItem.value
        ? await cartPageController.setFoodItemtoCart(myFoodItem.value)
        : await cartPageController.updateFoodItemToCart(myFoodItem.value);

    isCartItem.value = true;
    cartPageController.getAllCartFoodItem();
  }

  setFavoriteItem(int quantity) async {
    myFoodItem.value.quantity = quantity;

    !isFavoriteItem.value
        ? await favoritePageController.setFoodItemToFavorite(myFoodItem.value)
        : await favoritePageController
            .updateFoodItemToFavorite(myFoodItem.value);
    isFavoriteItem.value = true;
    favoritePageController.getAllFavoriteFoodItem();
  }

  checkOsFavorite() {
    favoritePageController.listOfFavoriteFoodItem.forEach((element) {
      if (element.id == myFoodItem.value.id) {
        isFavoriteItem.value = true;
      }

      Logger().d("isFavoriteItem : $isFavoriteItem");
    });
  }

  checkIfInCart() {
    cartPageController.listOfCartFoodItems.forEach((element) {
      if (element.id == myFoodItem.value.id) {
        isCartItem.value = true;
      }

      Logger().d("isCartItem : $isCartItem");
    });
  }

  @override
  void onInit() {
    super.onInit();
    checkOsFavorite();
    checkIfInCart();
  }
}
