import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:flutter/material.dart';
import 'package:graphx/graphx.dart';

class CoffeeDescriptionScene extends Sprite {
  CoffeesClass coffeeData;

  CoffeeDescriptionScene(this.coffeeData) {
    onAddedToStage.addOnce(_initUI);
    //graphics.beginFill(Colors.green.value).drawCircle(10, 10, 10).endFill();
  }

  StaticText title;

  Future<void> _initUI() async {
    title = StaticText(

      text: coffeeData.name,
      textStyle: StaticText.getStyle(

        color: Colors.white,
        fontSize: 22,
        fontFamily: "Lora",
      ),
    );
    addChild(title);
    title.x = 100;
    title.tween(duration: 3, x: 20);
  }
}
