import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

class BottomBarWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  ScrollController _bottomController;

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    final List<String> _buttons = <String>['Coffees', 'Machines', 'Grinders'];

    return ListView.builder(
        itemCount: 3,
//        padding: EdgeInsets.only(left: context.width * 2),
        scrollDirection: Axis.horizontal,
        controller: _bottomController,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              SizedBox(
                width: context.width * 5,
              ),
              Button(
                buttonText: _buttons[index],
                buttonTextStyle: mainTheme.textTheme.headline5,
                buttonColor: mainTheme.primaryColor,
                buttonShadowColor: mainTheme.primaryColor,
                height: context.height * 5,
                width: context.width * 30,
                onTap: () {},
              ),
            ],
          );
        });
  }
}
