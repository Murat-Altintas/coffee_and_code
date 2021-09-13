import 'package:coffee_and_code/View/MainScreens/SecondLeftBar.dart';
import 'package:coffee_and_code/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'style/theme.dart';
import 'utils/app_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.locale ??= AppLocales.supportedLocales.first;
    // print(Get.locale);
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      locale: Get.locale,
      fallbackLocale: AppLocales.supportedLocales.first,
      localeResolutionCallback: (locale, supported) =>
          AppLocales.supportedLocales.first,
      supportedLocales: AppLocales.supportedLocales,
      translationsKeys: TData.getByKeys(),
      theme: kThemeLight,
      home: SecondLeftBar(),
      // child: FirstLeftBar(),
    );
  }
}

/*
AnimatedSplashScreen(
          duration: 1000,
          splash: Icons.home,
          nextScreen: LoginScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.blue),
 */
