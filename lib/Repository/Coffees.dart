import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoffeesClass extends GetxController {
  var products = List<CoffeesClass>().obs;

  final String name, imagePath, description, weight, type, aroma, brewing, height, variety;
  final int price;
  final List<Color> gradient;
  final Color bgColor;

  @override
  void onInit() {
    super.onInit();
    CoffeesClass();
  }

  CoffeesClass(
      {this.name,
      this.imagePath,
      this.description,
      this.weight,
      this.price,
      this.gradient,
      this.type,
      this.bgColor,
      this.aroma,
      this.brewing,
      this.height,
      this.variety});
}

List<List<CoffeesClass>> coffeesType = <List<CoffeesClass>>[singleOrigin, singleServe, blendCoffees];

List<CoffeesClass> singleOrigin = <CoffeesClass>[
  CoffeesClass(
    name: "Kenya",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/kenya.png",
    weight: "250gr",
    price: 35,
    height: "1700-200M",
    type: "Single Serve",
    brewing: "Espresso, V60, Filter",
    aroma: "Chocolate, Brown Sugar and Dried Fruit Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(215, 155, 86, 1),
    gradient: [Color.fromRGBO(65, 41, 41, 1), Color.fromRGBO(215, 155, 86, 1)],
  ),
  CoffeesClass(
    name: "Brasil",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/brasil.png",
    weight: "250gr",
    price: 35,
    height: "1700-200M",
    type: "Single Serve",
    brewing: "Espresso, V60, Filter",
    aroma: "Fruits, Sugar and Dried Fruit Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(165, 207, 185, 1),
    gradient: [Color.fromRGBO(73, 127, 125, 1), Color.fromRGBO(165, 207, 185, 1)],
  ),
  CoffeesClass(
    name: "Costa Rica",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/costarica.png",
    weight: "250gr",
    price: 35,
    height: "1700-200M",
    type: "Single Serve",
    brewing: "Espresso, V60, Filter",
    aroma: "White Chocolate and Hazelnut Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(110, 207, 238, 1),
    gradient: [Color.fromRGBO(25, 84, 146, 1), Color.fromRGBO(110, 207, 238, 1)],
  ),
];

List<CoffeesClass> singleServe = <CoffeesClass>[
  CoffeesClass(
    name: "Kenya",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/kenya.png",
    weight: "250gr",
    price: 35,
    height: "1700-200M",
    type: "Single Serve",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(215, 155, 86, 1),
    gradient: [Color.fromRGBO(65, 41, 41, 1), Color.fromRGBO(215, 155, 86, 1)],
  ),
  CoffeesClass(
    name: "Brasil",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/brasil.png",
    weight: "250gr",
    type: "Single Serve",
    brewing: "Espresso, V60, Filter",
    price: 35,
    height: "1700-200M",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(165, 207, 185, 1),
    gradient: [Color.fromRGBO(73, 127, 125, 1), Color.fromRGBO(165, 207, 185, 1)],
  ),
  CoffeesClass(
    name: "Costa Rica",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/costarica.png",
    weight: "250gr",
    type: "Single Serve",
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(110, 207, 238, 1),
    gradient: [Color.fromRGBO(25, 84, 146, 1), Color.fromRGBO(110, 207, 238, 1)],
  ),
];

List<CoffeesClass> blendCoffees = <CoffeesClass>[
  CoffeesClass(
    name: "Christmas Blend",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_blend.png",
    weight: "250gr",
    type: "Blend",
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(235, 105, 103, 1),
    gradient: [Color.fromRGBO(177, 38, 45, 1), Color.fromRGBO(235, 105, 103, 1)],
  ),
  CoffeesClass(
    name: "Christmas Decaf",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_decaf.png",
    weight: "250gr",
    type: "Blend",
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(73, 153, 114, 1),
    gradient: [Color.fromRGBO(20, 109, 84, 1), Color.fromRGBO(80, 200, 99, 1)],
  ),
  CoffeesClass(
    name: "Espresso Roast Vintage",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/espresso_roast_vintage.png",
    weight: "250gr",
    type: "Blend",
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(235, 105, 103, 1),
    gradient: [Color.fromRGBO(132, 62, 60, 1), Color.fromRGBO(235, 105, 103, 1)],
  ),
  CoffeesClass(
    name: "Holiday Blend",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/holiday_blend.png",
    weight: "250gr",
    type: "Blend",
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    bgColor: Color.fromRGBO(228, 206, 180, 1),
    gradient: [Color.fromRGBO(186, 140, 97, 1), Color.fromRGBO(228, 206, 180, 1)],
  ),
];
