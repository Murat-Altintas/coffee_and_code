import 'package:flutter/material.dart';

class CoffeesClass {
  final List<String> weight, grinding;
  final List<int> piece;
  final String name, imagePath, description, aroma, brewing, height, variety;
  final int price;
  final List<Color> gradient;
  final Color bgColor;

  CoffeesClass({
    this.name,
    this.imagePath,
    this.description,
    this.weight,
    this.price,
    this.gradient,
    this.piece,
    this.bgColor,
    this.aroma,
    this.brewing,
    this.height,
    this.variety,
    this.grinding,
  });
}

List<List<CoffeesClass>> coffeesType = <List<CoffeesClass>>[
  singleOrigin,
  singleServe,
  blendCoffees
];

List<CoffeesClass> singleOrigin = <CoffeesClass>[
  CoffeesClass(
    name: "Kenya",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/kenya.png",
    weight: ["250gr", "500gr", "1kg"],
    price: 35,
    height: "1700-200M",
    piece: [1,2,3,4,5,6,7,8,9,10],
    brewing: "Espresso, V60, Filter",
    aroma: "Chocolate, Brown Sugar and Dried Fruit Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(215, 155, 86, 1),
    gradient: [Color.fromRGBO(65, 41, 41, 1), Color.fromRGBO(215, 155, 86, 1)],
  ),
  CoffeesClass(
    name: "Brasil",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/brasil.png",
    weight: ["250gr", "500gr", "1kg"],
    price: 35,
    height: "1700-200M",
     piece: [1,2,3,4,5,6,7,8,9,10],
    brewing: "Espresso, V60, Filter",
    aroma: "Fruits, Sugar and Dried Fruit Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(165, 207, 185, 1),
    gradient: [
      Color.fromRGBO(73, 127, 125, 1),
      Color.fromRGBO(165, 207, 185, 1)
    ],
  ),
  CoffeesClass(
    name: "Costa Rica",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/costarica.png",
    weight: ["250gr", "500gr", "1kg"],
    price: 35,
    height: "1700-200M",
     piece: [1,2,3,4,5,6,7,8,9,10],
    brewing: "Espresso, V60, Filter",
    aroma: "White Chocolate and Hazelnut Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(110, 207, 238, 1),
    gradient: [
      Color.fromRGBO(25, 84, 146, 1),
      Color.fromRGBO(110, 207, 238, 1)
    ],
  ),
];

List<CoffeesClass> singleServe = <CoffeesClass>[
  CoffeesClass(
    name: "Kenya",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/kenya.png",
    weight: ["250gr", "500gr", "1kg"],
    price: 35,
    height: "1700-200M",
     piece: [1,2,3,4,5,6,7,8,9,10],
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(215, 155, 86, 1),
    gradient: [Color.fromRGBO(65, 41, 41, 1), Color.fromRGBO(215, 155, 86, 1)],
  ),
  CoffeesClass(
    name: "Brasil",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/brasil.png",
    weight: ["250gr", "500gr", "1kg"],
     piece: [1,2,3,4,5,6,7,8,9,10],
    brewing: "Espresso, V60, Filter",
    price: 35,
    height: "1700-200M",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(165, 207, 185, 1),
    gradient: [
      Color.fromRGBO(73, 127, 125, 1),
      Color.fromRGBO(165, 207, 185, 1)
    ],
  ),
  CoffeesClass(
    name: "Costa Rica",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/costarica.png",
    weight: ["250gr", "500gr", "1kg"],
     piece: [1,2,3,4,5,6,7,8,9,10],
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(110, 207, 238, 1),
    gradient: [
      Color.fromRGBO(25, 84, 146, 1),
      Color.fromRGBO(110, 207, 238, 1)
    ],
  ),
];

List<CoffeesClass> blendCoffees = <CoffeesClass>[
  CoffeesClass(
    name: "Christmas Blend",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_blend.png",
    weight: ["250gr", "500gr", "1kg"],
     piece: [1,2,3,4,5,6,7,8,9,10],
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(235, 105, 103, 1),
    gradient: [
      Color.fromRGBO(177, 38, 45, 1),
      Color.fromRGBO(235, 105, 103, 1)
    ],
  ),
  CoffeesClass(
    name: "Christmas Decaf",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/christmas_decaf.png",
    weight: ["250gr", "500gr", "1kg"],
     piece: [1,2,3,4,5,6,7,8,9,10],
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(73, 153, 114, 1),
    gradient: [Color.fromRGBO(20, 109, 84, 1), Color.fromRGBO(80, 200, 99, 1)],
  ),
  CoffeesClass(
    name: "Espresso Roast",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/espresso_roast_vintage.png",
    weight: ["250gr", "500gr", "1kg"],
     piece: [1,2,3,4,5,6,7,8,9,10],
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(235, 105, 103, 1),
    gradient: [
      Color.fromRGBO(132, 62, 60, 1),
      Color.fromRGBO(235, 105, 103, 1)
    ],
  ),
  CoffeesClass(
    name: "Holiday Blend",
    description:
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
    imagePath: "assets/images/holiday_blend.png",
    weight: ["250gr", "500gr", "1kg"],
     piece: [1,2,3,4,5,6,7,8,9,10],
    price: 35,
    height: "1700-200M",
    brewing: "Espresso, V60, Filter",
    aroma: "Caramel and Fruits Notes",
    variety: "Doairri",
    grinding: ["Espresso", "Filter", "Aeropress", "Turkish"],
    bgColor: Color.fromRGBO(228, 206, 180, 1),
    gradient: [
      Color.fromRGBO(186, 140, 97, 1),
      Color.fromRGBO(228, 206, 180, 1)
    ],
  ),
];
