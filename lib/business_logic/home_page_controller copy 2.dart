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

class HomePageController extends BaseController {
  FoodItemsRepository foodItemsRepository =
      FoodItemsRepository(foodItemServices: FoodItemsService.instance);

  RxList<FoodItem> listOfFoodItem = <FoodItem>[].obs;
  RxList<FoodItem> searchListOfFoodItem = <FoodItem>[].obs;

  /// get List of FoodItem
  getAllFoodItem() async {
    loading.value = true; // set loading true to stop circle progress indicator
    listOfFoodItem.value = (await foodItemsRepository.getAllFoodItem());
    loading.value =
        false; // set loading false to stop circle progress indicator
  }

  void searchedForItems(String searchedFoodItem) {
    searchListOfFoodItem.value = listOfFoodItem.value
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
    getAllFoodItem(); // get all food items when the controller created
    super.onInit();
  }
}
