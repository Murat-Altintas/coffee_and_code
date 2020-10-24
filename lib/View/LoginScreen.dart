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

/*
                  AnimatedPositioned(
                    duration: Duration(seconds: 2),
                    onEnd: () {
                      print("finish");
                    },
                    top: _top,
                    child: Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Container(
                        width: 40,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.elliptical(50, 100)),
                          color: mainTheme.accentColor,
                        ),
                      ),
                    ),
                  ),
 */

import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Theme/MainTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

List<String> _menuList = ["Sign In", "Sign Up", "Restore Password"];

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  int checkIndex = 0;
  double _top = 160;

  TextStyle blueStyle = mainTheme.textTheme.headline2.copyWith(color: Colors.orange);

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  TextStyle yellowStyle = mainTheme.textTheme.headline2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(width: context.width * 100, height: context.height * 98, child: LeftMenu(indexChecked, checkIndex)),
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
                            final _checkIndex = checkIndex + 1 > 2 ? 0 : checkIndex + 1;
                            indexChecked(_checkIndex);
                          },
                          child: Text("Increase!"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.elasticInOut,
              onEnd: () {
                print("finish");
              },
              top: _top,
              child: Padding(
                padding: EdgeInsets.only(left: 52),
                child: RotatedBox(
                    quarterTurns: 5,
                    child: Container(
                      width: 10,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mainTheme.primaryColor,
                      ),
                    )),

                /*
                  Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(60, 60)),
                    color: mainTheme.primaryColorLight,
                  ),
                )
                   */
              ),
            ),
          ],
        ),
      ),
    );
  }

  final pointsPostions = <double>[160, 410, 650];

  void indexChecked(int i) {
    setState(() {
      checkIndex = i;
      _top = pointsPostions[i];
    });
  }
}

class LeftMenu extends StatelessWidget {
  LeftMenu(this.indexChecked, this.checkIndex);

  final void Function(int) indexChecked;
  final int checkIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
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
        ..._menuList.map((e) => _menuText(context, _menuList.indexOf(e))).toList(),
        Spacer(),
      ],
    );
  }

  Widget _menuText(BuildContext context, int i) {
    return Expanded(
      flex: 7,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: TextButton(
              onPressed: () {
                indexChecked(i);
              },
              child: Text(_menuList[i],
                  style: checkIndex == i
                      ? mainTheme.textTheme.headline2.copyWith(color: mainTheme.primaryColor, fontSize: context.normalText)
                      : mainTheme.textTheme.headline2.copyWith(color: mainTheme.primaryColorLight, fontSize: context.normalText)),
            ),
          ),
        ],
      ),
    );
  }
}

/*
160
410
650
 */
