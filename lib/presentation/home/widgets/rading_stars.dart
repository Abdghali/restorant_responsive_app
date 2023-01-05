import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStars extends StatelessWidget {
  double rating;
  RatingStars({this.rating = 0.0});
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      unratedColor: Colors.amber.shade100,
      itemBuilder: (context, index) => const Icon(
        CupertinoIcons.star_fill,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 5.5.w,
      direction: Axis.horizontal,
    );
  }
}
