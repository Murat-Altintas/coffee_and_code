import 'package:flutter/material.dart';

class BlendCoffeesClass {
  final String name, imagePath, discription, weight;
  final int price;
  final List<Color> colors;

  BlendCoffeesClass({this.name, this.imagePath, this.discription, this.weight, this.price, this.colors});
}

List blendCoffees = [
  BlendCoffeesClass(
    name: "Christmas Blend",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_blend.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(177, 38, 45, 1), Color.fromRGBO(235, 105, 103, 1)],
  ),
  BlendCoffeesClass(
    name: "Christmas Decaf",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_decaf.png",
    weight: "250gr",
    price: 35,

  ),
  BlendCoffeesClass(
    name: "Espresso Roast Vintage",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/espresso_roast_vintage.png",
    weight: "250gr",
    price: 35,
  ),
  BlendCoffeesClass(
    name: "Holiday Blend",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/holiday_blend.png",
    weight: "250gr",
    price: 35,
  ),
];
