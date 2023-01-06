// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/business_logic/cart_page_controller.dart';
import 'package:restaurant_app/data/models/food_item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  test('the total price should be 50 ', () {
    final controller = Get.put(CartPageController());
    controller.listOfCartFoodItems.value = [
      FoodItem(id: 1, name: 'Food1', imageUrl: '...', price: 20),
      FoodItem(id: 2, name: 'Food2', imageUrl: '...', price: 30),
    ];

    controller.calculatePrice();
    expect(controller.subTotalPrice, 50);
  });
}
