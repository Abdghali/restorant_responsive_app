import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/data/models/food_item.dart';

import '../data/repositories/foodItems_repository.dart';
import '../data/services/food_service2.dart';
import '../utility/my_app_color.dart';
import 'base_controller.dart';

class FavoritePageController extends BaseController {
  FoodItemsRepository foodItemsRepository =
      FoodItemsRepository(foodItemServices: FoodItemsService.instance);

  RxList<FoodItem> listOfFavoriteFoodItem = <FoodItem>[].obs;
  RxList<FoodItem> searchListOfFavorite = <FoodItem>[].obs;

  /// get List of favorite FoodItem
  getAllFavoriteFoodItem() async {
    loading.value = true;
    listOfFavoriteFoodItem.value =
        (await foodItemsRepository.getAllFavoriteFoodItem());
    Logger().e(
        'listOfQueryQSFavoriteFoodItem.value : ${listOfFavoriteFoodItem.value.length}');
    loading.value = false;
  }

  setFoodItemToFavorite(FoodItem foodItem) async {
    await foodItemsRepository.setFoodItemToFavorite(foodItem);
    Logger().e("added : ${foodItem.toJson()}");
    // TODO show flitter toast
  }

  deleteFoodItemFromFavorite(int id) async {
    await foodItemsRepository
        .deleteFoodItemFromFavorite(id); // delete food item by id
    await getAllFavoriteFoodItem(); // update listOfFavoriteFoodItem
  }

  //search functinonality

  void searchedForItems(String searchedFoodItem) {
    searchListOfFavorite.value = listOfFavoriteFoodItem.value
        .where((foodItem) => foodItem.name!
            .toLowerCase()
            .startsWith(searchedFoodItem.toLowerCase()))
        .toList();
  }

// build appBar action
  Widget acttionButton() {
    if (isSearching.value) {
      return IconButton(
        onPressed: () => stopSearching,
        icon: Icon(Icons.clear, color: MyAppColors.myGrey),
      );
    } else {
      return IconButton(
        onPressed: () => startSearch,
        icon: const Icon(
          Icons.search,
          color: MyAppColors.myGrey,
        ),
      );
    }
  }

  Widget searchField() {
    return TextField(
      controller: searchTextController.value,
      cursorColor: MyAppColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Find a Food Item...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyAppColors.myGrey, fontSize: 18.sp),
      ),
      style: TextStyle(color: MyAppColors.myGrey, fontSize: 18.sp),
      onChanged: (searchedCharacter) {
        searchedForItems(searchedCharacter);
      },
    );
  }

  Widget buildAppBarTitle() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        'Food Items',
        style: TextStyle(color: MyAppColors.myGrey, fontSize: 18.sp),
      ),
    );
  }

  Widget buildSearchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            const Color.fromARGB(255, 248, 139, 76).withOpacity(0.8),
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child:
                isSearching.value == true ? searchField() : buildAppBarTitle(),
          ),
          Expanded(
            flex: 1,
            child: isSearching.value == true
                ? IconButton(
                    onPressed: () {
                      isSearching.value = false;
                      clearSearch();
                    },
                    icon: Icon(Icons.clear, color: MyAppColors.myGrey),
                  )
                : IconButton(
                    onPressed: () {
                      isSearching.value = true;
                    },
                    icon: const Icon(
                      Icons.search,
                      color: MyAppColors.myGrey,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    getAllFavoriteFoodItem(); // get list of  FoodItems in Favorite collection when create this controller
    super.onInit();
  }
}
