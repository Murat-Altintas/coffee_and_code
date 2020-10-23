import 'package:coffee_and_code/Theme/MainTheme.dart';
import 'package:coffee_and_code/View/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

class Components extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> alertDialog(BuildContext context, headline) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(headline),
            titleTextStyle: mainTheme.textTheme.headline2.copyWith(fontSize: context.normalText),
            actions: [
              FlatButton(
                child: Text(
                  "OK",
                  style: mainTheme.textTheme.headline1.copyWith(fontSize: context.normalText),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          );
        });
  }
}
