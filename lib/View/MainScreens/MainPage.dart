import 'dart:ui';
import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Repository/BlendCoffees.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'BottomBarWidget.dart';
import 'ProductInfoWidget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return SafeArea(
      child: Column(
        children: [
          Flexible(flex: 3, child: Align(alignment: Alignment.centerLeft, child: Text("Coffees", style: mainTheme.textTheme.headline4))),
          Spacer(flex: 2),
          Flexible(
            flex: 1,
            child: ProductInfoWidget(),
          ),
          Spacer(flex: 10),
          Flexible(
            child: BottomBarWidget(),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
