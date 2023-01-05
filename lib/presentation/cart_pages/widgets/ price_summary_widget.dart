import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/presentation/cart_pages/widgets/price_summary_info_row.dart';
import 'package:restaurant_app/utility/my_app_color.dart';

import '../../../utility/my_app_style.dart';

class PriceSummaryMobile_widget extends StatelessWidget {
  final String? subtotalPrice;
  final String? taxPrice;
  final String? total;
  final String? buttonTitle;
  final VoidCallback? callback;
  final bool topBorderRadius;

  const PriceSummaryMobile_widget(
      {Key? key,
      this.taxPrice = '0.0',
      this.total = '0.0',
      this.subtotalPrice = '0.0',
      this.callback,
      required this.buttonTitle,
      this.topBorderRadius = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: topBorderRadius
            ? const BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              )
            : BorderRadius.zero,
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 21, 28, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PriceSummaryInfoRow(
                    carancy: 'USD', price: subtotalPrice, title: 'Subtotal'),
                SizedBox(
                  height: 9.h,
                ),
                PriceSummaryInfoRow(
                    carancy: 'USD', price: taxPrice, title: 'Tax'),
                SizedBox(
                  height: 16.h,
                ),
                const Divider(
                  height: 0,
                ),
                SizedBox(
                  height: 16.h,
                ),
                PriceSummaryInfoRow(
                  carancy: 'USD',
                  price: total,
                  title: 'Total',
                  priceTextStyle: MyAppStyle.cardRatingTextStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: SizedBox(
              height: 35.h,
              child: ElevatedButton(
                child: Text(buttonTitle!),
                onPressed: callback,
                style:
                    ElevatedButton.styleFrom(primary: MyAppColors.PrimaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
