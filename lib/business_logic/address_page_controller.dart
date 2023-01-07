import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_app/presentation/home/home_page.dart';
import 'package:restaurant_app/utility/constants.dart';
import '../data/models/address.dart';
import '../data/models/contact_info.dart';
import '../data/models/order.dart';
import '../data/repositories/foodItems_repository.dart';
import '../data/services/food_service2.dart';
import 'base_controller.dart';
import 'cart_page_controller.dart';

class AddressPageController extends BaseController {
  FoodItemsRepository foodItemsRepository =
      FoodItemsRepository(foodItemServices: FoodItemsService.instance);

  MyOrder order =
      MyOrder(address: Address(), contactInfo: ContactInfo(), totalPrice: 0.0);

// set contact info
  setName(String name) {
    order.contactInfo!.name = name;
  }

  setEmail(String email) {
    order.contactInfo!.email = email;
  }

  setPhoneNumber(String phoneNumber) {
    order.contactInfo!.phoneNumber = phoneNumber;
  }

// set address info
  setCity(String city) {
    order.address!.city = city;
  }

  setCountry(String country) {
    order.address!.country = country;
  }

  setStreet(String street) {
    order.address!.street = street;
  }

  setPostCode(String postCode) {
    order.address!.postCode = postCode;
  }

  submitOrder() {
    foodItemsRepository.setOrder(order);
    Get.offAll(HomePage());
  }

  @override
  void onInit() {
    super.onInit();
    CartPageController cartControoler = Get.find<CartPageController>();

    order.cartFoodItems = cartControoler.listOfCartFoodItems;
    order.tax = tax;
    order.totalPrice = cartControoler.totalPrice.value;
    order.subtotal = cartControoler.subTotalPrice.value;
    Logger().e(order.toJson());
  }
}
