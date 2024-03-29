import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/View/MainScreens/MainPage.dart';
import 'package:coffee_and_code/i18n/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

final _trk = TKeys.view.mainScreens.secondLeftBar;

List<String> get _coffeeList => [
      _trk.africa.tr,
      _trk.america.tr,
      _trk.blend.tr,
      _trk.options.tr,
      // "Africa",
      // "America",
      // "Blend",
      // "Options",
    ];

class SecondLeftBar extends StatefulWidget {
  @override
  _SecondLeftBarState createState() => _SecondLeftBarState();
}

class _SecondLeftBarState extends State<SecondLeftBar> {
  PageController _myTabController = PageController();

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
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
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    MainCoffeeClass(
                      mainList: _coffeeList,
                    ),
                    Center(
                      child: Text(
                          // 'Machines',
                          _trk.machines.tr,
                          style: mainTheme.textTheme.headline3),
                    ),
                    Center(
                      child: Text(
                          // '3rd Party',
                          _trk.thirdParty.tr,
                          style: mainTheme.textTheme.headline3),
                    ),
                  ],
                  controller: _myTabController,
                )),
            // list[_checkTab],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 75),
                child: BottomBarWidget(
                  currentTab: _tabChecked,
                ),
              ),
            ),
            SizedBox(height: context.height2),
          ],
        ),
      ),
    );
  }

  void _tabChecked(int c) {
    _myTabController.jumpToPage(c);
    // setState(() {
    // _checkTab = c;
    //});
  }
}

//_menuList[i]
class BottomBarWidget extends StatelessWidget {
  final void Function(int current) currentTab;

  const BottomBarWidget({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  static final _trk = TKeys.view.mainScreens.secondLeftBar;

  List<String> get ButtonCategoryList => [
        _trk.coffees.tr,
        _trk.machines.tr,
        _trk.thirdGen.tr,
        // "Coffees",
        // "Machines",
        // "3rd Gen",
      ];

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    // List ButtonCategoryList = ["Coffees", "Machines", "3rd Gen"];
    return ListView.builder(
      padding: EdgeInsets.only(left: context.width2 * 2),
      scrollDirection: Axis.horizontal,
      itemCount: ButtonCategoryList.length,
      itemBuilder: (BuildContext context, index) {
        return Row(
          children: [
            Button(
              child: Text(ButtonCategoryList[index],
                  style: mainTheme.textTheme.headline5),
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
