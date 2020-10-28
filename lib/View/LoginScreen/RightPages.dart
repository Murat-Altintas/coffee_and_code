import 'package:coffee_and_code/View/LoginScreen/LoginPage.dart';
import 'package:flutter/material.dart';

class RightSide extends StatefulWidget {
  RightSide(this.myController);
final PageController myController;

  @override
  _RightSideState createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: widget.myController,
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            children: [
              MainScreen(),
            ],
          ),
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
      ),
    );
  }
}
