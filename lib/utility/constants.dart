import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/cart_pages/cart_page.dart';
import 'package:restaurant_app/presentation/home/home_page.dart';

import '../presentation/favourite/favourite_page.dart';
import 'my_app_color.dart';
import 'my_app_style.dart';
import 'package:get/get.dart';

double tax = 0.10;

Widget _buildAppBarTitle() {
  return Text(
    'food_menu'.tr,
    style: TextStyle(color: MyAppColors.myGrey),
  );
}

final _searchTextController = TextEditingController();

Widget _buildSearchField() {
  return TextField(
    controller: _searchTextController,
    cursorColor: MyAppColors.myGrey,
    decoration: InputDecoration(
      hintText: 'Find a character...',
      border: InputBorder.none,
      hintStyle: TextStyle(color: MyAppColors.myGrey, fontSize: 18),
    ),
    style: TextStyle(color: MyAppColors.myGrey, fontSize: 18),
    onChanged: (searchedCharacter) {
      addSearchedFOrItemsToSearchedList(searchedCharacter);
    },
  );
}

void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
  print("searchedCharacter");
  // searchedForCharacters = allCharacters
  //     .where((character) =>
  //         character.name!.toLowerCase().startsWith(searchedCharacter))
  //     .toList();
  // setState(() {});
}

bool _isSearching = false;

/// start-- AppBar
var myAppBar = AppBar(
  backgroundColor: MyAppColors.PrimaryColor,
  title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
  centerTitle: false,
  actions: [
    IconButton(
        onPressed: () {
          Get.to(CartPage());
        },
        icon: Icon(Icons.shopping_cart_checkout))
  ],
);

/// end-- AppBar

/// Start Pading
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);

///-- end Pading

/// my drawer
var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  elevation: 0,
  child: Column(
    children: [
      DrawerHeader(
        child: Icon(
          Icons.favorite,
          size: 64,
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(
            Icons.home,
            color: MyAppColors.PrimaryColor,
          ),
          onTap: (() {
            Get.to(HomePage());
          }),
          title: Text(
            'home'.tr,
            style: MyAppStyle.drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(
            Icons.favorite,
            color: MyAppColors.PrimaryColor,
          ),
          onTap: (() => Get.to(FavouritePage())),
          title: Text(
            'favorite'.tr,
            style: MyAppStyle.drawerTextColor,
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: Icon(
            Icons.shopping_cart,
            color: MyAppColors.PrimaryColor,
          ),
          onTap: (() => Get.to(CartPage())),
          title: Text(
            'cart'.tr,
            style: MyAppStyle.drawerTextColor,
          ),
        ),
      ),
    ],
  ),
);
