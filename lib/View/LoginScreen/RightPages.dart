import 'package:coffee_and_code/Components/TextField.dart';
import 'package:coffee_and_code/View/LoginScreen/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

class RightSide extends StatefulWidget {
  RightSide(this.myController);
  final PageController myController;

  @override
  _RightSideState createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.myController,
      scrollDirection: Axis.horizontal,
      children: [
        LoginPage(),
        Container(
          width: 100,
          height: 100,
          color: Colors.orange,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
