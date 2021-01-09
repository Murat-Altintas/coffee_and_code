import 'package:coffee_and_code/Components/ProductBackShape.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/MainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

import 'MainScreens/SecondLeftBar.dart';

class ProductInfoPage extends StatefulWidget {
  final CoffeesClass coffeesClass;

  ProductInfoPage(this.coffeesClass);

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(
                Size.infinite.width,
                context.height2 * 85,
              ),
              painter: ProductBackShape(Color.fromRGBO(228, 206, 180, 1)),
            ),
            Positioned(
              top: context.height2 * 5,
              child: Material(
                color: mainTheme.primaryColorLight,
                child: Row(
                  children: [
                    SizedBox(
                      width: context.width2 * 5,
                    ),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        Get.to(SecondLeftBar());
                      },
                      iconSize: context.iconSmall,
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    ),
                    SizedBox(
                      width: context.width2 * 47,
                    ),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      iconSize: context.iconSmall,
                      color: Colors.black,
                      icon: Icon(Icons.search),
                    ),
                    SizedBox(
                      width: context.width2 * 5,
                    ),
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {},
                      iconSize: context.iconSmall,
                      color: mainTheme.primaryColorDark,
                      icon: Icon(Icons.format_list_bulleted_rounded),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: context.width2 * 5,
              top: context.height2 * 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: context.width2 * 40, child: Text(widget.coffeesClass.name, style: mainTheme.textTheme.headline6)),
                  SizedBox(
                    height: context.lowestContainer,
                  ),
                  Text("PRICE", style: mainTheme.primaryTextTheme.headline1),
                  Text(widget.coffeesClass.price.toString() + "€", style: mainTheme.primaryTextTheme.headline2),
                  SizedBox(
                    height: context.lowestContainer,
                  ),
                  Text("WEIGHT", style: mainTheme.primaryTextTheme.headline1),
                  Text(widget.coffeesClass.weight, style: mainTheme.primaryTextTheme.headline2),
                  SizedBox(
                    height: context.lowestContainer,
                  ),
                  Text("TYPE", style: mainTheme.primaryTextTheme.headline1),
                  Text(widget.coffeesClass.type, style: mainTheme.primaryTextTheme.headline2),
                ],
              ),
            ),
            Positioned(
              left: context.width2 * 55,
              top: context.height2 * 15,
              child: Container(
                width: context.width2 * 40,
                child: Image.asset(widget.coffeesClass.imagePath),
              ),
            ),
            //
            //Text(widget.coffeesClass.weight),
          ],
        ),
      ),
    );
  }
}
