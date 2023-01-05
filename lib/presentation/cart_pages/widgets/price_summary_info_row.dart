import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utility/my_app_style.dart';

class PriceSummaryInfoRow extends StatelessWidget {
  final String? title;
  final String? carancy;
  final String? price;
  final TextStyle? priceTextStyle;
  const PriceSummaryInfoRow(
      {Key? key,
      this.title,
      this.carancy = 'USD',
      this.price = '0',
      this.priceTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          title ?? "",
          style: MyAppStyle.cardRatingTextStyle.copyWith(fontSize: 15.sp),
        ),
        Row(
          children: [
            Column(
              children: [
                AutoSizeText(
                  carancy ?? 'USD',
                  style:
                      MyAppStyle.cardRatingTextStyle.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(
              width: 1.w,
            ),
            AutoSizeText(
              price ?? '00',
              style: priceTextStyle == null
                  ? MyAppStyle.cardTitleTextStyle.copyWith(fontSize: 16.sp)
                  : priceTextStyle,
            )
          ],
        )
      ],
    );
  }
}
