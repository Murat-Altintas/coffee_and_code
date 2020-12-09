import 'package:flutter/material.dart';

class CoffeesClass {
  final String name, imagePath, discription, weight;
  final int price;
  final List<Color> colors;

  CoffeesClass({this.name, this.imagePath, this.discription, this.weight, this.price, this.colors});
}

List<List<CoffeesClass>> coffeesType = <List<CoffeesClass>>[singleOrigin, singleServe, blendCoffees];

List<CoffeesClass> singleOrigin = <CoffeesClass>[
  CoffeesClass(
    name: "Christmas Blend",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_blend.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(177, 38, 45, 1), Color.fromRGBO(235, 105, 103, 1)],
  ),
  CoffeesClass(
    name: "Christmas Decaf",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_decaf.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(20, 109, 84, 1), Color.fromRGBO(80, 200, 99, 1)],
  ),
  CoffeesClass(
    name: "Espresso Roast Vintage",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/espresso_roast_vintage.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(132, 62, 60, 1), Color.fromRGBO(235, 105, 103, 1)],
  ),
  CoffeesClass(
    name: "Holiday Blend",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/holiday_blend.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(186, 140, 97, 1), Color.fromRGBO(228, 206, 180, 1)],
  ),
];

List<CoffeesClass> singleServe = <CoffeesClass>[
  CoffeesClass(
    name: "Kenya",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/kenya.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(65, 41, 41, 1), Color.fromRGBO(215, 155, 86, 1)],
  ),
  CoffeesClass(
    name: "Brasil",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/brasil.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(73, 127, 125, 1), Color.fromRGBO(165, 207, 185, 1)],
  ),
  CoffeesClass(
    name: "Costa Rica",
    discription:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/costarica.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(25, 84, 146, 1), Color.fromRGBO(110, 207, 238, 1)],
  ),
];

List<CoffeesClass> blendCoffees = <CoffeesClass>[
  CoffeesClass(
    name: "Christmas Blend",
    discription:
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_blend.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(177, 38, 45, 1), Color.fromRGBO(235, 105, 103, 1)],
  ),
  CoffeesClass(
    name: "Christmas Decaf",
    discription:
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_decaf.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(20, 109, 84, 1), Color.fromRGBO(80, 200, 99, 1)],
  ),
  CoffeesClass(
    name: "Espresso Roast Vintage",
    discription:
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/espresso_roast_vintage.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(132, 62, 60, 1), Color.fromRGBO(235, 105, 103, 1)],
  ),
  CoffeesClass(
    name: "Holiday Blend",
    discription:
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/holiday_blend.png",
    weight: "250gr",
    price: 35,
    colors: [Color.fromRGBO(186, 140, 97, 1), Color.fromRGBO(228, 206, 180, 1)],
  ),
];
