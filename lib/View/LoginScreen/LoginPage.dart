import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/TextField.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _TextController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return Padding(
      padding: context.paddingMedium,
      child: Column(
        children: [
          Spacer(
            flex: 7,
          ),
          Expanded(
            flex: 15,
            child: RichText(
              text: TextSpan(
                text: "Welcome back\n",
                style: mainTheme.textTheme.headline2,
                children: <TextSpan>[
                  TextSpan(
                    text: '\nA wide range of specialty coffees, tea and beverages.',
                    style: mainTheme.textTheme.headline3.copyWith(fontSize: context.normalText),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: TextFields(
              controller: _TextController,
              keyboardType: TextInputType.emailAddress,
              error: "test",
              hintText: "test@test.com",
              textStyle: mainTheme.textTheme.headline1,
              obscureText: false,
            ),
          ),
          Expanded(
            flex: 30,
            child: TextFields(
              controller: _PasswordController,
              keyboardType: TextInputType.number,
              error: "test",
              hintText: "123456",
              textStyle: mainTheme.textTheme.headline1,
              obscureText: true,
            ),
          ),
          Expanded(
            flex: 5,
            child: Button(buttonColor: mainTheme.buttonColor, buttonShadowColor: mainTheme.buttonColor, buttonText: "Text",),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
