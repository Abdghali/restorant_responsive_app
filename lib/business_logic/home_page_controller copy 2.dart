import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/data/models/food_item.dart';

import '../data/repositories/foodItems_repository.dart';
import '../data/services/food_service2.dart';
import '../utility/my_app_color.dart';
import 'base_controller.dart';

class HomePageController extends BaseController {
  FoodItemsRepository foodItemsRepository =
      FoodItemsRepository(foodItemServices: FoodItemsService.instance);

  RxList<FoodItem> listOfFoodItem = <FoodItem>[].obs;
  // RxList<FoodItem> searchListOfFoodItem = <FoodItem>[].obs;

  /// get List of FoodItem
  getAllFoodItem() async {
    loading.value = true; // set loading true to stop circle progress indicator
    listOfFoodItem.value = (await foodItemsRepository.getAllFoodItem());
    loading.value =
        false; // set loading false to stop circle progress indicator
  }

  // Widget buildSearchField() {
  //   return TextField(
  //     controller: searchTextController.value,
  //     cursorColor: MyAppColors.myGrey,
  //     decoration: InputDecoration(
  //       hintText: 'Find a Food Item...',
  //       border: InputBorder.none,
  //       hintStyle: TextStyle(color: MyAppColors.myGrey, fontSize: 18),
  //     ),
  //     style: TextStyle(color: MyAppColors.myGrey, fontSize: 18),
  //     onChanged: (searchedCharacter) {
  //       searchedForItems(searchedCharacter);
  //     },
  //   );
  // }

  // void searchedForItems(String searchedFoodItem) {
  //   searchListOfFoodItem.value = listOfFoodItem.value
  //       .where((foodItem) =>
  //           foodItem.name!.toLowerCase().startsWith(searchedFoodItem))
  //       .toList();
  // }

  // Widget buildAppBarTitle() {
  //   return Text(
  //     'Food Items',
  //     style: TextStyle(color: MyAppColors.myGrey),
  //   );
  // }

  // void startSearch() {
  //   ModalRoute.of(Get.context!)!
  //       .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

  //   isSearching.value = true;
  // }

  // void stopSearching() {
  //   clearSearch();
  //   isSearching.value = false;
  // }

  @override
  void onInit() {
    getAllFoodItem(); // get all food items when the controller created
    super.onInit();
  }
}
