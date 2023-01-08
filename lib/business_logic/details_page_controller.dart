// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
// import 'package:restaurant_app/data/models/food_item.dart';

// import 'cart_page_controller.dart';
// import 'counter_getx_controller.dart';
// import 'favorite_page_controller.dart';

// class DetailsPageController extends GetxController {
//   RxBool isCartItem = false.obs; // is item in cart list
//   RxBool isFavoriteItem = false.obs; // is item in Favorite list

//   addToCart(FoodItem foodItem) async {
//     await cartPageController.setFoodItemtoCart(foodItem);
//   }

//   updateCartItem(FoodItem foodItem) async {
//     await cartPageController.updateFoodItemToCart(foodItem);
//   }

//   addToFavorite(FoodItem foodItem) async {
//     await favoritePageController.setFoodItemToFavorite(foodItem);
//   }

//   updateFavoriteItem(FoodItem foodItem) async {
//     await favoritePageController.updateFoodItemToFavorite(foodItem);
//   }

// //check if item in cart list
//   checkIsFavoriteItem() {
//     Logger().e(isFavoriteItem.value);
//   }

// // check if item in Favorite list
//   checkIsCartItem() {
//     Logger().e(cartPageController.listOfCartFoodItems.length);
//   }

//   @override
//   void onInit() {
//     checkIsFavoriteItem();
//     checkIsCartItem();
//     super.onInit();
//   }
// }
