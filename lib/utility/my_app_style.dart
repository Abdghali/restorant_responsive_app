import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_app_color.dart';

class MyAppStyle {
  static TextStyle deActivedrawerTextColor = TextStyle(
    color: Colors.grey[600],
  );
  static TextStyle sctivedrawerTextColor = TextStyle(
    color: MyAppColors.PrimaryColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    color: MyAppColors.PrimaryColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle cardTitleTextStyle = TextStyle(
    fontSize: 14,
    color: MyAppColors.PrimaryColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle boldTitleTextStyle = TextStyle(
    fontSize: 18,
    color: MyAppColors.blackColor,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle cardRatingTextStyle = TextStyle(
    fontSize: 12,
    color: MyAppColors.blackColor,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle priceTextStyle = TextStyle(
    fontSize: 16,
    color: MyAppColors.MyGreenColor,
    fontWeight: FontWeight.w600,
  );
}
