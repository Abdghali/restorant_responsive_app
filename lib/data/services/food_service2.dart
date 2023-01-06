import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/data/models/food_item.dart';
import 'package:restaurant_app/data/models/order.dart';

import '../../exceptions/db_exception.dart';

class FoodItemsService {
  FoodItemsService._();
  static final FoodItemsService _foodItemsService = FoodItemsService._();
  static FoodItemsService get instance => _foodItemsService;

// instance from firebase firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

// logger for view the errors and value in the terminal console
  Logger logger = Logger();

// get
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getAllFoodItem() async {
    try {
      QuerySnapshot<Map<String, dynamic>> value =
          await firestore.collection('FoodItems').get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>>
          listOfQueryDocumentSnapshot = value.docs;
      return listOfQueryDocumentSnapshot;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Somthing wrong',
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }
  }

  storeFoodItem(FoodItem foodItem) async {
    try {
      await firestore
          .collection('FoodItems')
          .doc(foodItem.id.toString())
          .set(foodItem.toJson())
          .then((value) => logger.d("FoodItems values stored Sucessfully "))
          .catchError((e) => logger.e(e));
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Somthing wrong',
        gravity: ToastGravity.BOTTOM,
      );
      throw DBException('storeFoodItem db Exception');
    }
  }

//  get All Favorite FoodItem()

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getAllFavoriteFoodItem() async {
    try {
      QuerySnapshot<Map<String, dynamic>> value =
          await firestore.collection('FavoriteFoodItems').get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>>
          listOfQueryDocumentSnapshot = value.docs;
      return listOfQueryDocumentSnapshot;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Somthing wrong',
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }
  }

  setFoodItemToFavorite(FoodItem foodItem) async {
    try {
      bool isItemExsist =
          await isFoodItemExistIngCollection('FavoriteFoodItems', foodItem.id!);
      if (isItemExsist == false) {
        await firestore
            .collection('FavoriteFoodItems')
            .doc(foodItem.id.toString())
            .set(foodItem.toJson())
            .then(
              (value) => Fluttertoast.showToast(
                msg: 'Item added Sucessfully',
                gravity: ToastGravity.BOTTOM,
              ),
            )
            .catchError((e) => Fluttertoast.showToast(
                  msg: 'Somthing wrong',
                  gravity: ToastGravity.BOTTOM,
                ));
      } else {
        Fluttertoast.showToast(
          msg: 'Item Already exist',
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Somthing wrong',
        gravity: ToastGravity.BOTTOM,
      );
      throw DBException('setFoodItemToFavorite db Exception');
    }
  }

  // delete food item by Id
  deleteFoodItemFromFavorite(int id) async {
    try {
      await firestore
          .collection('FavoriteFoodItems')
          .doc(id.toString())
          .delete()
          .then((value) => Fluttertoast.showToast(
                msg: 'Item deleted Sucessfully',
                gravity: ToastGravity.BOTTOM,
              ))
          .catchError((e) => Fluttertoast.showToast(
                msg: 'Somthing wrong',
                gravity: ToastGravity.BOTTOM,
              ));
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Somthing wrong',
        gravity: ToastGravity.BOTTOM,
      );
      throw DBException('deleteFoodItemFromFavorite db Exception');
    }
  }

//  get All Favorite FoodItem()

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>
      getAllCartFoodItems() async {
    try {
      QuerySnapshot<Map<String, dynamic>> value =
          await firestore.collection('CartFoodItems').get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>>
          listOfQueryDocumentSnapshot = value.docs;
      return listOfQueryDocumentSnapshot;
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Somthing wrong',
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }
  }

  Future<bool> isFoodItemExistIngCollection(
      String collectionName, int id) async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await firestore
          .collection(collectionName)
          .where('id', isEqualTo: id)
          .get();
      if (data.docs.first.id.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  setFoodItemtoCart(FoodItem foodItem) async {
    try {
      bool isItemExsist =
          await isFoodItemExistIngCollection('CartFoodItems', foodItem.id!);
      if (isItemExsist == false) {
        await firestore
            .collection('CartFoodItems')
            .doc(foodItem.id.toString())
            .set(foodItem.toJson())
            .then((value) => Fluttertoast.showToast(
                  msg: 'Item added Sucessfully',
                  gravity: ToastGravity.BOTTOM,
                ))
            .catchError((e) => Fluttertoast.showToast(
                  msg: 'Somthing wrong1',
                  gravity: ToastGravity.BOTTOM,
                ));
      } else {
        Fluttertoast.showToast(
          msg: 'Item Already exist',
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Somthing wrong...',
        gravity: ToastGravity.BOTTOM,
      );
      throw DBException('setFoodItemtoCart db Exception');
    }
  }

  deleteFoodItemFromCart(int id) async {
    try {
      await firestore
          .collection('CartFoodItems')
          .doc(id.toString())
          .delete()
          .then((value) => Fluttertoast.showToast(
                msg: 'Item deleted Sucessfully',
                gravity: ToastGravity.BOTTOM,
              ))
          .catchError((e) => Fluttertoast.showToast(
                msg: 'Somthing wrong',
                gravity: ToastGravity.BOTTOM,
              ));
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Somthing wrong',
        gravity: ToastGravity.BOTTOM,
      );
      throw DBException('CartFoodItems db Exception');
    }
  }

  setOrder(MyOrder order) async {
    try {
      await firestore
          .collection('Orders')
          .doc()
          .set(order.toJson())
          .then((value) => AwesomeDialog(
                context: Get.context!,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'Order',
                desc: 'Order submitted successfully',
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              )..show())
          .catchError((e) => logger.e(e));
    } catch (e) {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Order',
        desc: 'Order submitted Faild',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
      throw DBException('setOrder db Exception');
    }
  }
}
