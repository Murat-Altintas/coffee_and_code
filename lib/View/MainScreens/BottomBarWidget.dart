import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

class BottomBarWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return ListView(
      padding: EdgeInsets.only(left: context.width * 2),
      scrollDirection: Axis.horizontal,
      children: [
        Button(
          buttonText: "Coffees",
          buttonTextStyle: mainTheme.textTheme.headline5,
          buttonColor: mainTheme.primaryColor,
          buttonShadowColor: mainTheme.primaryColor,
          height: context.height * 5,
          width: context.width * 30,
          onTap: () {},
        ),
      ],
    );
  }
}
