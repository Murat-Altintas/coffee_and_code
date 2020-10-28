import 'package:coffee_and_code/Components/TextField.dart';
import 'package:coffee_and_code/Theme/MainTheme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFields(
          controller: TextController,
          keyboardType: TextInputType.emailAddress,
          error: "Error",
          hintText: "Hint",
          textStyle: mainTheme.textTheme.headline1,
        ),
      ),
    );
  }
}
