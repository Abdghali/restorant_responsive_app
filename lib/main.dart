import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/business_logic/bindings/app_bindings.dart';
import 'firebase_options.dart';
import 'presentation/home/home_page.dart';
import 'splash_pages/splash_page.dart';
import 'utility/my_app_color.dart';
import 'utility/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  ScreenUtil.init;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            title: 'restorant_Appp',
            debugShowCheckedModeBanner: false,
            translations: AppTranslations(),
            locale: const Locale('en', 'US'),
            theme: ThemeData(
              scaffoldBackgroundColor: MyAppColors.backgroundColor,
              primaryColor: MyAppColors.PrimaryColor,
            ),
            home: SplashPage(),
            initialBinding: AppBinding());
      },
    );
  }
}
