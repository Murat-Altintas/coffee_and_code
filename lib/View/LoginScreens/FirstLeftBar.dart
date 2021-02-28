import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'RestorePasswordPage.dart';
import 'SignInPage.dart';
import 'SignUpPage.dart';

List<String> _menuList = ["Sign In", "Sign Up", "Restore Password"];

class FirstLeftBar extends StatefulWidget {
  @override
  _FirstLeftBarState createState() => _FirstLeftBarState();
}

class _FirstLeftBarState extends State<FirstLeftBar> {
  PageController _myController = PageController();
  int _checkIndex = 0;
  double _top;
  List<double> _pointsPositions;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox.expand(
                child: LayoutBuilder(
                  builder: (context, constrants) {
                    double height = constrants.maxHeight;
                    _pointsPositions = [
                      height / 5.4,
                      height / 2.1,
                      height / 1.17
                    ];
                    _top ??= _pointsPositions[0];
                    return Stack(
                      children: [
                        Positioned(
                          top: height / 25,
                          child: _menuTextWidget(
                            controller: (i) {
                              _myController.animateToPage(i,
                                  duration: Duration(seconds: 2),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            indexChecked: indexChecked,
                            checkIndex: _checkIndex,
                            i: 0,
                          ),
                        ),
                        Positioned(
                          top: height / 3,
                          child: _menuTextWidget(
                            controller: (i) {
                              _myController.animateToPage(i,
                                  duration: Duration(seconds: 2),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            indexChecked: indexChecked,
                            checkIndex: _checkIndex,
                            i: 1,
                          ),
                        ),
                        Positioned(
                          top: height / 1.5,
                          child: _menuTextWidget(
                            controller: (i) {
                              _myController.animateToPage(i,
                                  duration: Duration(seconds: 2),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            indexChecked: indexChecked,
                            checkIndex: _checkIndex,
                            i: 2,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(seconds: 1),
                          curve: Curves.elasticInOut,
                          top: _top - height / 16,
                          child: Padding(
                            padding: EdgeInsets.only(left: context.width2 * 10),
                            child: Container(
                              width: context.width2 * 1.5,
                              height: context.width2 * 1.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: mainTheme.primaryColorLight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _myController,
                scrollDirection: Axis.horizontal,
                children: [
                  SignInPage(),
                  SignUpPage(),
                  RestorePasswordPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void indexChecked(int i) {
    setState(() {
      _checkIndex = i;
      _top = _pointsPositions[i] + 0;
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
    final mainTheme = Theme.of(context);

    return RotatedBox(
      quarterTurns: 3,
      child: FlatButton(
        splashColor: mainTheme.primaryColor,
        highlightColor: mainTheme.primaryColor,
        minWidth: context.width2 * 32,
        onPressed: () {
          indexChecked(i);
          controller(i);
        },
        child: Text(_menuList[i],
            style: checkIndex == i
                ? mainTheme.textTheme.headline2
                : mainTheme.textTheme.button),
      ),
    );
  }
}

/*
160
410
650
 */
