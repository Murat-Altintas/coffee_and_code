import 'package:coffee_and_code/View/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';

class RightSide extends StatefulWidget {
  @override
  _RightSideState createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.green,
        child: PageView(
          //controller: LoginScreen().myController,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
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
      ),
    );
  }
}
