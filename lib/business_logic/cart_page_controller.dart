import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/data/models/food_item.dart';
import 'package:restaurant_app/utility/constants.dart';

import '../data/repositories/foodItems_repository.dart';
import '../data/services/food_service2.dart';
import 'base_controller.dart';

class CartPageController extends BaseController {
  FoodItemsRepository foodItemsRepository =
      FoodItemsRepository(foodItemServices: FoodItemsService.instance);

  RxList<FoodItem> listOfCartFoodItems = <FoodItem>[].obs;

  RxDouble subTotalPrice =
      0.0.obs; // sub total price for all food item in the cart
  RxDouble totalPrice = 0.0.obs; //  total price for all food item in the cart

  /// get List of foodItem
  getAllCartFoodItem() async {
    loading.value = true;
    listOfCartFoodItems.value = await foodItemsRepository.getAllCartFoodItem();
    calculatePrice(); // calculate total price

    loading.value = false;
  }

  setFoodItemtoCart(FoodItem foodItem) async {
    await foodItemsRepository.setFoodItemtoCart(foodItem);
    await getAllCartFoodItem();
  }

  deleteFoodItemFromCart(int id) async {
    await foodItemsRepository.deleteFoodItemFromCart(id); // delete all user
    await getAllCartFoodItem(); // update  cart food item list
  }

  updateFoodItemToCart(FoodItem foodItem) async {
    await foodItemsRepository.updateFoodItemToCart(foodItem);
    await getAllCartFoodItem();
  }

// calculate total price
  calculatePrice() {
    subTotalPrice.value = 0.0;
    listOfCartFoodItems.value.forEach((foodItem) {
      double price = foodItem.quantity! * foodItem.price!;
      subTotalPrice.value += price;
    });
    totalPrice.value = subTotalPrice.value + tax;
  }

  @override
  void onInit() {
    getAllCartFoodItem(); // get list of  FoodItems in the cart collection when create this controller
    super.onInit();
  }
}
