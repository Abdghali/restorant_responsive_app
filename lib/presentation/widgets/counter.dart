import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/business_logic/counter_getx_controller.dart';

class CounterWidget extends StatelessWidget {
  final CounterController counterController;
  final double width;
  final double height;
  CounterWidget(
      {Key? key,
      this.width = 35,
      this.height = 35,
      required this.counterController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.grey.withOpacity(0.1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                counterController.decrement();
              },
              icon: Icon(
                CupertinoIcons.minus,
                color: Colors.grey,
                size: 20.h,
              )),
          const VerticalDivider(
            color: Colors.black,
            thickness: 0.1,
          ),
          Obx(
            () => Text(counterController.counter.toString()),
          ),
          const VerticalDivider(
            color: Colors.black,
            thickness: 0.1,
          ),
          IconButton(
              onPressed: () {
                counterController.increment();
              },
              icon: Icon(
                CupertinoIcons.add,
                color: Colors.grey,
                size: 20.h,
              )),
        ],
      ),
    );
  }
}
