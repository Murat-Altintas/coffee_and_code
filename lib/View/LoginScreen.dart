/*
AnimatedPositioned(
              child: Center(
                child: Container(
                  width: 40,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.elliptical(50 , 100)),
                    color: mainTheme.accentColor,
                  ),
                ),
              ),
              duration: Duration(seconds: 2),
              top: _top,
            ),
 */

import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Theme/MainTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  List<String> _menuList = ["Sign In", "Sign Up", "Restore Password"];
  int checkIndex = 0;
  double _top = 0.0;
  GlobalKey globalKey;
  List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  Offset checkedPositionOffset = Offset(0, 0);
  Offset lastCheckOffset = Offset(0, 0);

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});

    SchedulerBinding.instance.endOfFrame.then((value) {
      calculateCheckOffset();
    });
  }

  void calculateCheckOffset() {
    lastCheckOffset = checkedPositionOffset;

    RenderBox renderBox = _keys[checkIndex].currentContext.findRenderObject();

    Offset widgetOffset = renderBox.localToGlobal(Offset(0, 0));

    Size widgetSise = renderBox.size;

    checkedPositionOffset = Offset(widgetOffset.dx + widgetSise.width, widgetOffset.dy + widgetSise.height / 4 * 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: context.width * 70,
                color: Colors.blue,
                child: Stack(
                  children: [
                    Container(
                      width: context.width * 100,
                      height: context.height * 98,
                      color: mainTheme.primaryColorDark,
                      child: Column(
                        children: _menuText(),
                      ),
                    ),
                    Positioned(
                      top: checkedPositionOffset.dx,
                      left: checkedPositionOffset.dy,
                      child: CustomPaint(
                        painter: CheckPointPainter(checkedPositionOffset),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: context.width * 100,
                height: context.height * 98,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {
                        _increaseHeight();
                      },
                      child: Text("Increase!"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _menuText() {
    List<Widget> _menuTextList = [];

    _menuTextList.add(Expanded(flex: 1, child: SizedBox()));
    _menuTextList.add(
      Expanded(
        flex: 1,
        child: RotatedBox(
          quarterTurns: 3,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: mainTheme.primaryColorLight,
          ),
        ),
      ),
    );
    for (int i = 0; i < _menuList.length; i++) {
      _menuTextList.add(
        Expanded(
          flex: 7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      indexChecked(i);
                    });
                  },
                  child: Text(
                    _menuList[i],
                    style: checkIndex == i
                        ? mainTheme.textTheme.headline2.copyWith(fontSize: context.normalText)
                        : mainTheme.textTheme.headline2.copyWith(fontSize: context.normalText, color: mainTheme.primaryColorLight),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: checkIndex == i ? mainTheme.accentColor : mainTheme.primaryColorDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

      _menuTextList.add(Expanded(
        flex: 2,
        child: SizedBox(),
      ));
    }
    return _menuTextList;
  }

  void indexChecked(int i) {
    if (checkIndex == i) return;
    setState(() {
      checkIndex = i;
    });
  }

  void _increaseHeight() {
    setState(() {
      _top = _top >= 10 ? 0 : _top += 30;
    });
  }
}

class CheckPointPainter extends CustomPainter {
  double pointRadius = 5;
  double radius = 30;

  Offset offset;

  CheckPointPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    double startAngle = -pi / 2;
    double sweepAngle = pi;

    paint.color = Colors.lightGreen;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(offset.dx, offset.dy), radius: radius),
      startAngle,
      sweepAngle,
      true,
      paint,
    );

    paint.color = Colors.blue;
    canvas.drawCircle(Offset(offset.dx - pointRadius / 2, offset.dx - pointRadius), pointRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
