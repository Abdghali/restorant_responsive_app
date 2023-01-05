import 'package:restaurant_app/data/models/address.dart';
import 'package:restaurant_app/data/models/food_item.dart';

import 'contact_info.dart';

class MyOrder {
  Address? address;
  ContactInfo? contactInfo;
  double? totalPrice;
  double? subtotal;
  double? tax;
  List<FoodItem>? cartFoodItems;

  MyOrder(
      {this.address, this.contactInfo, this.totalPrice, this.cartFoodItems});

  MyOrder.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    contactInfo = json['contact_info'] != null
        ? new ContactInfo.fromJson(json['contact_info'])
        : null;
    totalPrice = json['total_price'];
    subtotal = json['subtotal'];
    tax = json['tax'];

    if (json['cartFoodItems'] != null) {
      cartFoodItems = <FoodItem>[];
      json['cartFoodItems'].forEach((v) {
        cartFoodItems!.add(FoodItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.contactInfo != null) {
      data['contact_info'] = this.contactInfo!.toJson();
    }
    data['total_price'] = this.totalPrice;
    data['subtotal'] = this.subtotal;
    data['tax'] = this.tax;

    if (this.cartFoodItems != null) {
      data['cartFoodItems'] =
          this.cartFoodItems!.map((foodItem) => foodItem.toJson()).toList();
    }
    return data;
  }
}
