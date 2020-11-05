import 'package:coffee_and_code/Components/AlertDialog.dart';
import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/SocialMediaButtons.dart';
import 'package:coffee_and_code/Components/TextField.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _TextController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return Padding(
      padding: context.paddingMedium,
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Expanded(
            flex: 13,
            child: Lottie.asset(
              "assets/lottie/login_lottie.json",
              reverse: true,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Welcome back;",
              style: mainTheme.textTheme.headline2,
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                TextFields(
                  controller: _TextController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "test@test.com",
                  textStyle: mainTheme.textTheme.headline1,
                  obscureText: false,
                ),
                TextFields(
                  controller: _PasswordController,
                  keyboardType: TextInputType.number,
                  hintText: "123456",
                  textStyle: mainTheme.textTheme.headline1,
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                      splashColor: mainTheme.primaryColorLight,
                      highlightColor: mainTheme.primaryColorLight,
                      splashRadius: context.width * 5,
                      icon: obscureText == true ? Icon(Icons.visibility_rounded, color: mainTheme.primaryColor) : Icon(Icons.visibility_off),
                      onPressed: _showPassword),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 6,
          ),
          Button(
            onTap: () {
              AlertDialogClass().alertDialog(context, "Complete");
            },

            height: context.height * 5,
            width: context.width * 80,
            buttonColor: mainTheme.primaryColorLight,
            buttonShadowColor: mainTheme.primaryColorLight,
            buttonText: "Sign In",
            buttonTextStyle: mainTheme.textTheme.headline6,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: mainTheme.primaryColorLight,
                  thickness: 1,
                ),
              ),
              Text("  or sign in with  "),
              Expanded(
                child: Divider(
                  color: mainTheme.primaryColorLight,
                  thickness: 1,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialMediaButtons(
                buttonColor: Colors.indigo,
                buttonShadowColor: Colors.indigo,
                socialChild: SvgPicture.asset("assets/images/facebook-app-symbol.svg"),
                onTap: () {},
              ),
              SocialMediaButtons(
                buttonColor: Color.fromRGBO(0, 119, 183, 1),
                buttonShadowColor: Color.fromRGBO(0, 119, 183, 1),
                socialChild: SvgPicture.asset("assets/images/linkedin.svg"),
                onTap: () {},
              ),
              SocialMediaButtons(
                buttonColor: Color.fromRGBO(29, 161, 242, 1),
                buttonShadowColor: Color.fromRGBO(29, 161, 242, 1),
                socialChild: SvgPicture.asset("assets/images/twitter.svg"),
                onTap: () {},
              ),
            ],
          ),
          Spacer(
            flex: 6,
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
