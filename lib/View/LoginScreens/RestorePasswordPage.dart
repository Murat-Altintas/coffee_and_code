import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/SocialMediaButtons.dart';
import 'package:coffee_and_code/Components/TextField.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class RestorePasswordPage extends StatefulWidget {
  @override
  _RestorePasswordPageState createState() => _RestorePasswordPageState();
}

class _RestorePasswordPageState extends State<RestorePasswordPage> {
  TextEditingController _TextController = TextEditingController();

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return Padding(
      padding: context.paddingMedium,
      child: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 5,
            child: Lottie.asset(
              "assets/lottie/restore_password_lottie.json",
              reverse: true,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Write your e-mail;",
              style: mainTheme.textTheme.headline2,
            ),
          ),
          Expanded(
            flex: 5,
            child: TextFields(
              controller: _TextController,
              keyboardType: TextInputType.emailAddress,
              hintText: "test@test.com",
              textStyle: mainTheme.textTheme.headline1,
              obscureText: false,
            ),
          ),
          Spacer(),
          Button(
            onTap: () {
              obscureText = !obscureText;
            },
            height: context.height * 5,
            width: context.width * 80,
            buttonColor: mainTheme.primaryColorLight,
            buttonShadowColor: mainTheme.primaryColorLight,
            buttonText: "Restore Password",
            buttonTextStyle: mainTheme.textTheme.headline6,
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }

  void _showPassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
