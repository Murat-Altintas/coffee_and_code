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
  int checkIndex = 0;
  double _top;
  List<double> pointsPostions;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    pointsPostions = [160, 410, 650];
   // _top =100;
  }

  TextStyle yellowStyle = mainTheme.textTheme.headline2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: LayoutBuilder(
            builder: (context, constrants){
              double height = constrants.maxHeight ;
              print(height);
              pointsPostions = [ height/4-80+75,height/3-20+75,height/2+50+75];
              _top ??= pointsPostions[0];
               return Stack(
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: mainTheme.primaryColorLight,
                  ),
                ),
                Positioned(
                  top: height/4-80,
                 child: _menuTextWidget(indexChecked: indexChecked, checkIndex: checkIndex,i:0 ,),),
                Positioned(
                  top: height/3-20,
                  child: _menuTextWidget(indexChecked: indexChecked, checkIndex: checkIndex,i:1,),),
                Positioned(
                  top: height/2+50,
                  child: _menuTextWidget(indexChecked: indexChecked, checkIndex: checkIndex,i:2 ,),),
                /*
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
                 */
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  curve: Curves.elasticInOut,
                  onEnd: () {
                    print("finish");
                  },
                  top: _top-10,
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
            );},
          ),
        ),
      ),
    );
  }



  void indexChecked(int i) {
    setState(() {
      checkIndex = i;
      _top = pointsPostions[i]+0;
      print(_top);
    });
  }
}

class _LeftMenu extends StatelessWidget {
  _LeftMenu(this.indexChecked, this.checkIndex);

  final void Function(int) indexChecked;
  final int checkIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Expanded(
          flex: 1,

        ),
       // ..._menuList.map((e) => _menuText(context, _menuList.indexOf(e))).toList(),
        Spacer(),
      ],
    );
  }


}

class _menuTextWidget extends StatelessWidget {
  const _menuTextWidget({
    Key key,
    @required this.indexChecked,
    @required this.checkIndex,
    this.i,
  }) : super(key: key);

  final void Function(int p1) indexChecked;
  final int checkIndex;
  final int i;
  @override
  Widget build(BuildContext context) {
   // RenderBox object = context.findRenderObject();
    //Offset globalPostion = object.localToGlobal(Offset.zero);
    return  RotatedBox(
            quarterTurns: 3,
            child: FlatButton(
minWidth: 150,
              onPressed: () {
                indexChecked(i);
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
