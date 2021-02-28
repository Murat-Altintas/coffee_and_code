import 'package:coffee_and_code/View/MainScreens/SecondLeftBar.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _buildMainTheme(context),
          home: SecondLeftBar(),
          // child: FirstLeftBar(),
        );
      }),
    );
  }

  _buildMainTheme(BuildContext context) {
    return ThemeData(
      //primarySwatch: Colors.red,
      brightness: Brightness.light,
      primaryColor: Color.fromRGBO(140, 198, 210, 1),
      //colorScheme: ColorScheme.light(),
      //xxx
      primaryColorBrightness: Brightness.dark,
      primaryColorLight: Color.fromRGBO(230, 132, 97, 1),
      primaryColorDark: Color.fromRGBO(84, 54, 62, 1),
      accentColor: Color.fromRGBO(140, 198, 210, 1),
      //accentColorBrightness: Brightness.dark,
      //canvasColor: Color(0xfffafafa),
      //XX
      //scaffoldBackgroundColor: Color.fromRGBO(84, 54, 62, 1),
      //xx
      bottomAppBarColor: Color(0xffffffff),
      cardColor: Colors.red,
      dividerColor: Colors.red,
      //XX
      highlightColor: Color.fromRGBO(84, 54, 62, 1),
      splashColor: Colors.red,
      selectedRowColor: Colors.red,
      unselectedWidgetColor: Color(0x8a000000),
      disabledColor: Color(0x61000000),
      //xx
      buttonColor: Color.fromRGBO(84, 54, 62, 1),
      //toggleableActiveColor: Color(0xffe53935),
      secondaryHeaderColor: Colors.red,
      textSelectionColor: Color(0xffef9a9a),
      cursorColor: Color(0xff4285f4),
      textSelectionHandleColor: Color(0xffe57373),
      toggleButtonsTheme: ToggleButtonsThemeData(
          fillColor: Colors.pinkAccent,
          textStyle: TextStyle(
            color: Colors.red,
          ),
          selectedColor: Colors.white),
      //floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0xffC20003)),

      dialogBackgroundColor: Color(0xffffffff),

      indicatorColor: Colors.blue,
      //XX
      hintColor: Color(0x8a000000),
      //xx
      errorColor: Colors.red,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        minWidth: 88,
        height: 36,
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.red,
            width: context.height2 * 10,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        alignedDropdown: false,
        buttonColor: Colors.red,
        disabledColor: Color(0x61000000),
        highlightColor: Color(0x29000000),
        splashColor: Color(0x1f000000),
        focusColor: Color(0x1f000000),
        hoverColor: Color(0x0a000000),

        /*
    colorScheme: ColorScheme(
      primary: Colors.white,
      primaryVariant: Color(0xffd32f2f),
      secondary: Color(0xffC20003),
      //xx
      secondaryVariant: Color(0xffd32f2f),
      surface: Color(0xffffffff),
      background: Color(0xffef9a9a),
      error: Color(0xffd32f2f),
      onPrimary: Colors.white,
      //xx
      onSecondary: Color(0xff000000),
      onSurface: Color(0xff000000),
      onBackground: Color(0xffffffff),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
     */
      ),

      textTheme: TextTheme(
        headline1: TextStyle(
          color: Color.fromRGBO(140, 198, 210, 1),
          fontFamily: "Roboto",
          fontSize: context.smallText,
        ),
        headline2: TextStyle(
          color: Color.fromRGBO(230, 132, 97, 1),
          fontFamily: "Lora",
          fontSize: context.normalText,
        ),
        headline3: TextStyle(
          color: Color.fromRGBO(230, 132, 97, 1),
          fontFamily: "Roboto",
          fontSize: context.normalText,
        ),
        headline4: TextStyle(
          color: Color.fromRGBO(230, 132, 97, 1),
          fontFamily: "Lora",
          fontSize: context.height2 * 4,
        ),
        headline5: TextStyle(
          color: Color.fromRGBO(84, 54, 62, 1),
          fontFamily: "Roboto",
          fontSize: context.normalText,
        ),
        headline6: TextStyle(
          color: Color.fromRGBO(84, 54, 62, 1),
          fontFamily: "Lora",
          fontSize: context.height2 * 3.5,
        ),
        subtitle1: TextStyle(
          color: Color.fromRGBO(84, 54, 62, 1),
          fontFamily: "Lora",
          fontSize: context.normalText,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontFamily: "Lora",
          fontSize: context.heightText,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontFamily: "Roboto",
          fontSize: context.smallText,
        ),
        caption: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Color.fromRGBO(84, 54, 62, 1),
          fontFamily: "Lora",
          fontSize: context.normalText,
        ),
        subtitle2: TextStyle(
          color: Color(0xff000000),
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: Color(0xff000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      primaryTextTheme: TextTheme(
        //XX
        headline1: TextStyle(
          color: Color.fromRGBO(84, 54, 62, 1),
          fontFamily: "Roboto",
          fontSize: context.smallestText,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontFamily: "Lora",
          fontSize: context.normalText,
        ),
        headline3: TextStyle(
          color: Color.fromRGBO(230, 132, 97, 1),
          fontFamily: "Roboto",
          fontSize: context.smallText,
        ),
        headline4: TextStyle(
          color: Color.fromRGBO(84, 54, 62, 1),
          fontFamily: "Lora",
          fontSize: context.smallText,
        ),
        headline5: TextStyle(
          //XX
          color: Color(0xfffafafa),
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        headline6: TextStyle(
          //XX
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        bodyText2: TextStyle(
          color: Colors.white,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        caption: TextStyle(
          color: Colors.white,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        button: TextStyle(
          color: Colors.white,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        subtitle2: TextStyle(
          color: Colors.white,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        overline: TextStyle(
          color: Colors.white,
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        helperStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        hintStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        errorStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        errorMaxLines: null,
        isDense: false,
        contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
        isCollapsed: false,
        prefixStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        suffixStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        counterStyle: TextStyle(
          color: Color(0xdd000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        filled: false,
        fillColor: Color(0x00000000),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(230, 132, 97, 1),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(140, 198, 210, 1),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),

      iconTheme: IconThemeData(
        color: Color.fromRGBO(230, 132, 97, 1),
      ),
      primaryIconTheme: IconThemeData(
        color: Colors.purple,
      ),
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
