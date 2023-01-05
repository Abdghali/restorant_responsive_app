import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/data/models/food_item.dart';

import '../data/repositories/foodItems_repository.dart';
import '../data/services/food_service2.dart';
import 'base_controller.dart';

class FavoritePageController extends BaseController {
  FoodItemsRepository foodItemsRepository =
      FoodItemsRepository(foodItemServices: FoodItemsService.instance);

  RxList<FoodItem> listOfFavoriteFoodItem = <FoodItem>[].obs;

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

  @override
  void onInit() {
    getAllFavoriteFoodItem(); // get list of  FoodItems in Favorite collection when create this controller
    super.onInit();
  }
}
