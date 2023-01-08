import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/data/models/food_item.dart';
import 'package:restaurant_app/data/models/order.dart';
import '../services/food_service2.dart';

class FoodItemsRepository {
  final FoodItemsService foodItemServices;

  FoodItemsRepository({required this.foodItemServices});

  /// get List of QueryDocumentSnapshot
  Future<List<FoodItem>> getAllFoodItem() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? items =
        await foodItemServices.getAllFoodItem();

    return items!.map((item) => FoodItem.fromJson(item.data())).toList();
  }

  setFoodItemtoCart(FoodItem foodItem) async {
    await foodItemServices.setFoodItemtoCart(foodItem);
  }

  setFoodItemToFavorite(FoodItem foodItem) async {
    await foodItemServices.setFoodItemToFavorite(foodItem);
  }

  deleteFoodItemFromCart(int id) async {
    await foodItemServices.deleteFoodItemFromCart(id);
  }

  deleteFoodItemFromFavorite(int id) async {
    await foodItemServices.deleteFoodItemFromFavorite(id);
  }

  updateFoodItemToFavorite(FoodItem foodItem) async {
    await foodItemServices.updateFavoriteFoodItem(foodItem);
  }

  updateFoodItemToCart(FoodItem foodItem) async {
    await foodItemServices.updateCartFoodItem(foodItem);
  }

  // checkIfFoodItemFounded(){
  //  return  await foodItemServices.checkIfFoodItemFounded();
  // }

  /// get List of QueryDocumentSnapshot
  Future<List<FoodItem>> getAllFavoriteFoodItem() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? items =
        await foodItemServices.getAllFavoriteFoodItem();

    return items!.map((item) => FoodItem.fromJson(item.data())).toList();
  }

  /// get List of QueryDocumentSnapshot
  Future<List<FoodItem>> getAllCartFoodItem() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? items =
        await foodItemServices.getAllCartFoodItems();

    return items!.map((item) => FoodItem.fromJson(item.data())).toList();
  }

  setOrder(MyOrder myOrder) async {
    await foodItemServices.setOrder(myOrder);
  }
}
