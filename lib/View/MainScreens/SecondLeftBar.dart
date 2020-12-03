import 'package:coffee_and_code/Components/ProductWidget.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/BottomBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

List<String> _menuList = ["Single Origin", "Single Serve", "Blend"];

class SecondLeftBar extends StatefulWidget {
  @override
  _SecondLeftBarState createState() => _SecondLeftBarState();
}

class _SecondLeftBarState extends State<SecondLeftBar> {
  PageController _myController = PageController();
  int checkIndex = 0;
  double _top;
  List<double> pointsPositions;

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
                    pointsPositions = [height / 5.4, height / 2.1, height / 1.17];
                    _top ??= pointsPositions[0];
                    return Stack(
                      children: [
                        Positioned(
                          top: height / 25,
                          child: _menuTextWidget(
                            controller: (i) {
                              _myController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                            },
                            indexChecked: indexChecked,
                            checkIndex: checkIndex,
                            i: 0,
                          ),
                        ),
                        Positioned(
                          top: height / 3,
                          child: _menuTextWidget(
                            controller: (i) {
                              _myController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
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
                              _myController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
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
                            child: Container(
                              width: context.width * 1.5,
                              height: context.width * 1.5,
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
              child: Column(
                children: [
                  SizedBox(height: context.height  * 6),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Coffees", style: mainTheme.textTheme.headline4),
                  ),
                  SizedBox(height: context.height  * 6),
                  Expanded(
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      controller: _myController,
                      children: coffeesType.map((e) => PageView(
                                scrollDirection: Axis.horizontal,
                                children: e.map<Widget>((e) => ProductWidget(e)).toList(),
                              )).toList(),
                    ),
                  ),
                  SizedBox(height: context.height  * 6, child: BottomBarWidget()),
                  SizedBox(height: context.height  * 6),
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
    final mainTheme = Theme.of(context);

    return RotatedBox(
      quarterTurns: 3,
      child: FlatButton(
        splashColor: mainTheme.primaryColor,
        highlightColor: mainTheme.primaryColor,
        minWidth: context.width * 32,
        onPressed: () {
          indexChecked(i);
          controller(i);
        },
        child: Text(_menuList[i], style: checkIndex == i ? mainTheme.textTheme.headline2 : mainTheme.textTheme.headline6),
      ),
    );
  }
}

/*
160
410
650
 */