import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.network_wifi_1_bar_outlined,
            size: 100.w,
          ),
          AutoSizeText(
            'No Internet Connection..',
            style: TextStyle(fontSize: 20.sp),
          )
        ],
      )),
    );
  }
}
