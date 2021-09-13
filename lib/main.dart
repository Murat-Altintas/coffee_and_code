import 'package:coffee_and_code/View/MainScreens/SecondLeftBar.dart';
import 'package:coffee_and_code/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'style/theme.dart';
import 'utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocaleUtils.initLocale();
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      locale: Get.locale,
      fallbackLocale: AppLocales.supportedLocales.first,

      /// we don't need this as we are using Intl package now.
      // localeResolutionCallback: (locale, supported) =>
      //     AppLocales.supportedLocales.first,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
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
