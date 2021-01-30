import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ProductBackShape.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:get/get.dart';
import '../SecondLeftBar.dart';

class TopSpecs extends StatelessWidget {
  final CoffeesClass coffeesClass;

  TopSpecs(this.coffeesClass);

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: Size(
            Size.infinite.width,
            context.height2 * 90,
          ),
          painter: ProductBackShape(coffeesClass.bgColor),
        ),
        Positioned(
          top: context.height2 * 5,
          child: Material(
            color: coffeesClass.bgColor,
            child: Row(
              children: [
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
                  width: context.width2 * 73,
                ),
                IconButton(
                  splashRadius: 20,
                  splashColor: mainTheme.primaryColorLight,
                  highlightColor: mainTheme.primaryColorLight,
                  onPressed: () {},
                  iconSize: context.iconSmall,
                  color: mainTheme.primaryColorDark,
                  icon: Icon(Icons.shopping_basket_rounded),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: context.width2 * 5,
          top: context.height2 * 13,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: context.width2 * 40, child: Text(coffeesClass.name, style: mainTheme.textTheme.headline6)),
              SizedBox(
                height: context.lowContainer,
              ),
              Text("PRICE", style: mainTheme.primaryTextTheme.headline1),
              Text(coffeesClass.price.toString() + "€", style: mainTheme.primaryTextTheme.headline2),
              SizedBox(
                height: context.lowContainer,
              ),
              Text("WEIGHT", style: mainTheme.primaryTextTheme.headline1),
              Text(coffeesClass.weight, style: mainTheme.primaryTextTheme.headline2),
              SizedBox(
                height: context.lowContainer,
              ),
              Text("TYPE", style: mainTheme.primaryTextTheme.headline1),
              Text(coffeesClass.type, style: mainTheme.primaryTextTheme.headline2),
              SizedBox(
                height: context.height2 * 12,
              ),
            ],
          ),
        ),
        Positioned(
          left: context.width2 * 55,
          top: context.height2 * 14,
          child: Container(
            width: context.width2 * 40,
            child: Image.asset(coffeesClass.imagePath),
          ),
        ),
        Positioned(
          top: context.height2 * 57,
          left: context.width2 * 5,
          child: Button(
              buttonColor: mainTheme.primaryColorDark,
              buttonShadowColor: mainTheme.primaryColorDark,
              child: Icon(Icons.shopping_basket_outlined, color: Colors.white),
              onTap: () {},
              height: context.height2 * 7,
              width: context.width2 * 14),
        ),
      ],
    );
  }
}
