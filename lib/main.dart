import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coffee_and_code/View/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(

            duration: 1000,
            splash: Icons.home,
            nextScreen: LoginScreen(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Colors.blue));
  }
}
