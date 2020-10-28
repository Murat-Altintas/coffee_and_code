import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Theme/MainTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'RightSide.dart';

List<String> _menuList = ["Sign In", "Sign Up", "Restore Password"];

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PageController myController = PageController();
  int checkIndex = 0;
  double _top;
  List<double> pointsPositions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row( //read whatsapp pls
          children: [
            Expanded(
              flex: 1,
              child: SizedBox.expand(
                child: LayoutBuilder(
                  builder: (context, constrants) {
                    double height = constrants.maxHeight;
                    pointsPositions = [height / 3.4, height / 1.8, height / 1.17];
                    _top ??= pointsPositions[0];
                    return Stack(
                      children: [
                        Positioned(
                          top: height / 50,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: FlatButton(
                              minWidth: 50,
                              onPressed: () {},
                              child: Icon(
                                Icons.menu,
                                color: mainTheme.primaryColorLight,
                              ),
                              splashColor: mainTheme.primaryColor,
                              highlightColor: mainTheme.primaryColorDark,
                            ),
                          ),
                        ),
                        Positioned(
                          top: height / 7,
                          child: _menuTextWidget(
                            controller: (i) {
                              myController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                            },
                            indexChecked: indexChecked,
                            checkIndex: checkIndex,
                            i: 0,
                          ),
                        ),
                        Positioned(
                          top: height / 2.5,
                          child: _menuTextWidget(
                            controller: (i) {
                              myController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                            },
                            indexChecked: indexChecked,
                            checkIndex: checkIndex,
                            i: 1,
                          ),
                        ),
                        Positioned(
                          top: height / 1.5,
                          child: _menuTextWidget(
                            controller: (i) {
                              myController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                            },
                            indexChecked: indexChecked,
                            checkIndex: checkIndex,
                            i: 2,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(seconds: 1),
                          curve: Curves.elasticInOut,
                          top: _top - height / 16,
                          child: Padding(
                            padding: EdgeInsets.only(left: context.width * 10),
                            child: RotatedBox(
                                quarterTurns: 5,
                                child: Container(
                                  width: context.width * 2,
                                  height: context.width * 2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: mainTheme.primaryColor,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            RightSide(myController),
          ],
        ),
      ),
    );
  }

  void indexChecked(int i) {
    setState(() {
      checkIndex = i;
      _top = pointsPositions[i] + 0;
    });
  }
}

class _menuTextWidget extends StatelessWidget {
  const _menuTextWidget({
    Key key,
    @required this.indexChecked,
    @required this.checkIndex,
    this.i,
    @required this.controller,
  }) : super(key: key);

  final void Function(int p1) indexChecked;
  final int checkIndex;
  final int i;
  final void Function(int p2) controller;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: FlatButton(
        splashColor: mainTheme.primaryColor,
        highlightColor: mainTheme.primaryColorDark,
        minWidth: 150,
        onPressed: () {
          indexChecked(i);
          controller(i);
        },
        child: Text(_menuList[i],
            style: checkIndex == i
                ? mainTheme.textTheme.headline2.copyWith(color: mainTheme.primaryColor, fontSize: context.normalText)
                : mainTheme.textTheme.headline2.copyWith(color: mainTheme.primaryColorLight, fontSize: context.normalText)),
      ),
    );
  }
}

/*
160
410
650
 */
