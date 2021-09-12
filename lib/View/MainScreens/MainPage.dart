import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Components/ProductWidget.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import 'CartPage.dart';

class MainCoffeeClass extends StatefulWidget {
  final List<String> mainList;

  const MainCoffeeClass({Key? key, required this.mainList}) : super(key: key);

  @override
  _MainCoffeeClassState createState() => _MainCoffeeClassState(mainList);
}

class _MainCoffeeClassState extends State<MainCoffeeClass> {
  final totalPiece = Get.put(PieceController());
  late List<double> _pointsPositions;
  double? _top;
  PageController _myPageController = PageController();
  late int _leftTabs = 0;
  late int i;
  final List<String> incomingTextList;

  _MainCoffeeClassState(this.incomingTextList);

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: SizedBox.expand(
            child: LayoutBuilder(
              builder: (context, constrants) {
                double height = constrants.maxHeight;
                _pointsPositions = [
                  height / 6,
                  height / 2.4,
                  height / 1.47,
                  height / 1.02
                ];
                _top ??= _pointsPositions[0];
                return Stack(
                  children: [
                    Positioned(
                      top: height / 100,
                      child: _MenuTextWidget(
                        textList: incomingTextList,
                        animationController: (i) {
                          _myPageController.animateToPage(i,
                              duration: Duration(seconds: 2),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        indexChecked: _indexChecked,
                        chooseLeftTab: _leftTabs,
                        i: 0,
                      ),
                    ),
                    Positioned(
                      top: height / 3.8,
                      child: _MenuTextWidget(
                        textList: incomingTextList,
                        animationController: (i) {
                          _myPageController.animateToPage(i,
                              duration: Duration(seconds: 2),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        indexChecked: _indexChecked,
                        chooseLeftTab: _leftTabs,
                        i: 1,
                      ),
                    ),
                    Positioned(
                      top: height / 1.9,
                      child: _MenuTextWidget(
                        textList: incomingTextList,
                        animationController: (i) {
                          _myPageController.animateToPage(i,
                              duration: Duration(seconds: 2),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        indexChecked: _indexChecked,
                        chooseLeftTab: _leftTabs,
                        i: 2,
                      ),
                    ),
                    Positioned(
                      top: height / 1.2,
                      child: _MenuTextWidget(
                        textList: incomingTextList,
                        animationController: (i) {
                          _myPageController.animateToPage(i,
                              duration: Duration(seconds: 2),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        indexChecked: _indexChecked,
                        chooseLeftTab: _leftTabs,
                        i: 3,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(seconds: 1),
                      curve: Curves.elasticInOut,
                      top: _top! - height / 16,
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
                SizedBox(height: context.height2 * 2),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        getTabTitle(),
                        style: mainTheme.textTheme.headline4,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                    // Spacer(),
                    Stack(
                      children: [
                        IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            Get.to(() => CartPage());
                            /*
                            .map((everyItems) => PageView(
                                  scrollDirection: Axis.horizontal,
                                  children: everyItems
                                      .map<Widget>((e) => ProductWidget(e))
                                      .toList(),
                                ))
                            .toList(),
                             */
                          },
                          iconSize: context.iconSmall,
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: mainTheme.primaryColorDark,
                          ),
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                          child: GetX<PieceController>(
                            builder: (_) => Text(
                              "${totalPiece.totalPiece.toString()}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: context.height2 * 8),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: _myPageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: _leftTabs == 3

                        ///i "just" can see "Options Page" text in Enable Widget Select Mode? :/
                        ? [
                            Text("Options Page",
                                style: mainTheme.textTheme.headline4)
                          ]
                        : coffeesType
                            .map((everyItems) => PageView(
                                  scrollDirection: Axis.horizontal,
                                  children: everyItems
                                      .map<Widget>((e) => ProductWidget(e))
                                      .toList(),
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

  void _indexChecked(int p1) {
    setState(() {
      _leftTabs = p1;
      _top = _pointsPositions[p1] + 0;
    });
  }

  final titles = [
    "African Coffees",
    "American Coffees",
    "Blend",
    "Options Page",
  ];

  String getTabTitle() {
    return titles[_leftTabs];
  }
}

class _MenuTextWidget extends StatelessWidget {
  const _MenuTextWidget({
    Key? key,
    required this.indexChecked,
    required this.chooseLeftTab,
    required this.i,
    required this.animationController,
    required this.textList,
  }) : super(key: key);

  final void Function(int p1) indexChecked;
  final int chooseLeftTab;
  final int i;
  final void Function(int p2) animationController;
  final List textList;

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
        child: Text(textList[i],
            style: chooseLeftTab == i
                ? mainTheme.textTheme.headline2
                : mainTheme.textTheme.button),
      ),
    );
  }
}
