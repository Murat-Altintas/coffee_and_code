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
    List ButtonCategoryList = [
      "Coffees", "Machines", "Grinders", "3rd Gen"
    ];
    return ListView.builder(
      padding: EdgeInsets.only(left: context.width2 * 2),
      scrollDirection: Axis.horizontal,
      itemCount: ButtonCategoryList.length,
      itemBuilder: (BuildContext context, index) {
      return  Row(
        children: [
          Button(
              buttonText: ButtonCategoryList[index],
              buttonTextStyle: mainTheme.textTheme.headline5,
              buttonColor: mainTheme.primaryColor,
              buttonShadowColor: mainTheme.primaryColor,
              height: context.height2 * 5,
              width: context.width2 * 30,
              onTap: () {},
            ),
          SizedBox(
            width: context.width2 * 5,
          ),
        ],
      );
      },

    );
  }
}
