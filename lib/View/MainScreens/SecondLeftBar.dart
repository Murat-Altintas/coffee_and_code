import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ProductWidget.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/BottomBarWidget.dart';
import 'package:coffee_and_code/View/ProductInfoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

List<String> _menuList = ["Single Origin", "Single Serve", "Blend", "Options"];

class SecondLeftBar extends StatefulWidget {
  @override
  _SecondLeftBarState createState() => _SecondLeftBarState();
}

class _SecondLeftBarState extends State<SecondLeftBar> {
  PageController _myPageController = PageController();
  PageController _myTabController = PageController();
  int _leftTabs = 0;
  int _checkTab = 0;
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
        child: Column(
          children: [
            //     if(_checkTab ==0)
            //   _bulildCoffeeWidget( mainTheme),
            // if(_checkTab ==1)
            // Text( 'machıne'),
            Expanded(
                flex: 9,
                child: PageView(
                  children: [
                    _bulildCoffeeWidget(mainTheme),
                    Center(child: Text('Machines', style: mainTheme.textTheme.headline3),
                    ),],
                  controller: _myTabController,
                )),
            // list[_checkTab],
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 75),
                child: SizedBox(
                  height: context.height2 * 6,
                  child: BottomBarWidget(
                    currentTab: _tabChecked,
                  ),
                ),
              ),
            ),
            //SizedBox(height: context.height2 * 3),
          ],
        ),
      ),
    );
  }

  Widget _bulildCoffeeWidget(ThemeData mainTheme) {
    return Row(
      children: [
        Expanded(
          child: SizedBox.expand(
            child: LayoutBuilder(
              builder: (context, constrants) {
                double height = constrants.maxHeight;
                _pointsPositions = [height / 5, height / 2.05, height / 1.23, height / 1];
                _top ??= _pointsPositions[0];
                return Stack(
                  children: [
                    Positioned(
                      top: height / 100,
                      child: _menuTextWidget(
                        animationController: (i) {
                          _myPageController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                        },
                        indexChecked: _indexChecked,
                        chooseLeftTab: _leftTabs,
                        i: 0,
                      ),
                    ),
                    Positioned(
                      top: height / 3.3,
                      child: _menuTextWidget(
                        animationController: (i) {
                          _myPageController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                        },
                        indexChecked: _indexChecked,
                        chooseLeftTab: _leftTabs,
                        i: 1,
                      ),
                    ),
                    Positioned(
                      top: height / 1.7,
                      child: _menuTextWidget(
                        animationController: (i) {
                          _myPageController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                        },
                        indexChecked: _indexChecked,
                        chooseLeftTab: _leftTabs,
                        i: 2,
                      ),
                    ),
                    Positioned(
                      top: height / 1.2,
                      child: _menuTextWidget(
                        animationController: (i) {
                          _myPageController.animateToPage(i, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
                        },
                        indexChecked: _indexChecked,
                        chooseLeftTab: _leftTabs,
                        i: 3,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                SizedBox(height: context.height2 * 6),
                Row(
                  children: [
                    _leftTabs == 0
                        ? Text("Single Origin", style: mainTheme.textTheme.headline4)
                        : _leftTabs == 1
                            ? Text("Single Serve", style: mainTheme.textTheme.headline4)
                            : _leftTabs == 2
                                ? Text("Blend", style: mainTheme.textTheme.headline4)
                                : _leftTabs == 3
                                    ? Text("Options Page", style: mainTheme.textTheme.headline4)
                                    : null,
                    Spacer(),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      iconSize: context.iconSmall,
                      icon: Icon(Icons.shopping_basket),
                    ),
                  ],
                ),
                SizedBox(height: context.height2 * 6),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: _myPageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: _leftTabs == 3

                        ///i "just" can see "TEXT Page" text in Enable Widget Select Mode? :/
                        ? [Text("Options Page", style: mainTheme.textTheme.headline4)]
                        : coffeesType
                            .map((everyItems) => PageView(
                                  scrollDirection: Axis.horizontal,
                                  children: everyItems.map<Widget>((e) => ProductWidget(e)).toList(),
                                ))
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _indexChecked(int i) {
    setState(() {
      _leftTabs = i;
      _top = _pointsPositions[i] + 0;
    });
  }

  void _tabChecked(int c) {
    _myTabController.jumpToPage(c);
    // setState(() {
    // _checkTab = c;
    //});
  }
}

class _menuTextWidget extends StatelessWidget {
  const _menuTextWidget({
    Key key,
    @required this.indexChecked,
    @required this.chooseLeftTab,
    this.i,
    @required this.animationController,
  }) : super(key: key);

  final void Function(int p1) indexChecked;
  final int chooseLeftTab;
  final int i;
  final void Function(int p2) animationController;

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
          animationController(i);
        },
        child: Text(_menuList[i], style: chooseLeftTab == i ? mainTheme.textTheme.headline2 : mainTheme.textTheme.headline6),
      ),
    );
  }
}

class BottomBarWidget extends StatelessWidget {
  final void Function(int current) currentTab;

  const BottomBarWidget({
    Key key,
    @required this.currentTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    List ButtonCategoryList = ["Coffees", "Machines", "3rd Gen"];
    return ListView.builder(
      padding: EdgeInsets.only(left: context.width2 * 2),
      scrollDirection: Axis.horizontal,
      itemCount: ButtonCategoryList.length,
      itemBuilder: (BuildContext context, index) {
        return Row(
          children: [
            Button(
              buttonText: ButtonCategoryList[index],
              buttonTextStyle: mainTheme.textTheme.headline5,
              buttonColor: mainTheme.primaryColor,
              buttonShadowColor: mainTheme.primaryColor,
              height: context.height2 * 5,
              width: context.width2 * 30,
              onTap: () {
                currentTab(index);
              },
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
