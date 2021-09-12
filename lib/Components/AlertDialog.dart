import 'package:coffee_and_code/View/MainScreens/SecondLeftBar.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

class AlertDialogClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> alertDialog(BuildContext context, headline) {
    final mainTheme = Theme.of(context);

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(headline),
            titleTextStyle: mainTheme.textTheme.headline2!
                .copyWith(fontSize: context.normalText),
            actions: [
              TextButton(
                child: Text(
                  "OK",
                  style: mainTheme.textTheme.headline1!
                      .copyWith(fontSize: context.normalText),
                ),
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondLeftBar()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Theme(data: mainTheme, child: SecondLeftBar())));
                },
              ),
            ],
          );
        });
  }
}
