import 'package:coffee_and_code/i18n/i18n.dart';
import 'package:coffee_and_code/utils/app_utils.dart';
import 'package:coffee_and_code/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CoffeesClass {
  final List<String> weight, grinding;
  final List<int> piece;
  final String id,
      name,
      imagePath,
      description,
      aroma,
      brewing,
      height,
      variety;
  final List<Color> gradient;
  final Color bgColor;
  final double price;

  /// use this.... and find a way to convert the currencies values.
  String get priceCurrency => LocaleUtils.formatPrice(price);

  CoffeesClass({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.weight,
    required this.price,
    required this.gradient,
    required this.piece,
    required this.bgColor,
    required this.aroma,
    required this.brewing,
    required this.height,
    required this.variety,
    required this.grinding,
  });
}

List<List<CoffeesClass>> get coffeesType =>
    <List<CoffeesClass>>[singleOrigin, singleServe, blendCoffees];

// final _tkr1 = TKeys.coffess.singleOrigin;
final _trk = TKeys.coffess;

List<String> get commonGrinding {
  return [
    _trk.grindingTypes.espresso.tr,
    _trk.grindingTypes.filter.tr,
    _trk.grindingTypes.aeropress.tr,
    _trk.grindingTypes.turkish.tr,
    // "Espresso",
    // "Filter",
    // "Aeropress",
    // "Turkish",
  ];
}

String get defaultAroma {
  return _trk.aromas.caramelFruitNotes.tr;
}

String get defaultVariety {
  return _trk.variaties.doairri.tr;
}

String get defaultBrewing {
  return _trk.brewing.espressV60Filter.tr;
}

List<CoffeesClass> get singleOrigin {
  final _baseKey = _trk.singleOrigin;
  return <CoffeesClass>[
    CoffeesClass(
      id: "1",
      // name: "Kenya",
      name: _baseKey.kenya.name.tr,
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      description: _baseKey.kenya.description.tr,
      imagePath: "assets/images/kenya.png",
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      price: 35,
      height: "170-200 mm",
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      // brewing: "Espresso, V60, Filter",
      brewing: defaultBrewing,
      // aroma: "Chocolate, Brown Sugar and Dried Fruit Notes",
      aroma: _baseKey.kenya.aroma.tr,
      // variety: "Doairri",
      variety: defaultVariety,
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(215, 155, 86, 1),
      gradient: [
        Color.fromRGBO(65, 41, 41, 1),
        Color.fromRGBO(215, 155, 86, 1)
      ],
    ),
    CoffeesClass(
      id: "2",
      // name: "Brasil",
      // description:
      // "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      name: _baseKey.brasil.name.tr,
      description: _baseKey.brasil.description.tr,
      imagePath: "assets/images/brasil.png",
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      price: 35,
      height: "170-200M",
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      brewing: defaultBrewing,
      aroma: _baseKey.brasil.aroma.tr,
      // aroma: "Fruits, Sugar and Dried Fruit Notes",
      variety: defaultVariety,
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(165, 207, 185, 1),
      gradient: [
        Color.fromRGBO(73, 127, 125, 1),
        Color.fromRGBO(165, 207, 185, 1)
      ],
    ),
    CoffeesClass(
      id: "3",
      name: _baseKey.costaRica.name.tr,
      description: _baseKey.costaRica.description.tr,
      // name: "Costa Rica",
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      imagePath: "assets/images/costarica.png",
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      price: 35,
      height: "1700-200M",
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      brewing: defaultBrewing,
      // aroma: "White Chocolate and Hazelnut Notes",
      aroma: _baseKey.costaRica.aroma.tr,
      variety: defaultVariety,
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(110, 207, 238, 1),
      gradient: [
        Color.fromRGBO(25, 84, 146, 1),
        Color.fromRGBO(110, 207, 238, 1)
      ],
    ),
  ];
}

List<CoffeesClass> get singleServe {
  final _baseKey = _trk.singleServe;
  return <CoffeesClass>[
    CoffeesClass(
      id: "4",
      name: _baseKey.kenya.name.tr,
      description: _baseKey.kenya.description.tr,
      aroma: defaultAroma,
      // name: "Kenya",
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      imagePath: "assets/images/kenya.png",
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      price: 35,
      height: "1700-200M",
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      brewing: defaultBrewing,
      // aroma: "Caramel and Fruits Notes",
      variety: defaultVariety,
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(215, 155, 86, 1),
      gradient: [
        Color.fromRGBO(65, 41, 41, 1.0),
        Color.fromRGBO(215, 155, 86, 1)
      ],
    ),
    CoffeesClass(
      id: "5",
      name: _baseKey.brasil.name.tr,
      description: _baseKey.brasil.description.tr,
      aroma: defaultAroma,
      // name: "Brasil",
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      imagePath: "assets/images/brasil.png",
      // weight: ["250gr", "500gr", "1kg"],
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      brewing: defaultBrewing,
      price: 35,
      height: "1700-200M",
      // aroma: "Caramel and Fruits Notes",
      variety: defaultVariety,
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(165, 207, 185, 1),
      gradient: [
        Color.fromRGBO(73, 127, 125, 1.0),
        Color.fromRGBO(165, 207, 185, 1)
      ],
    ),
    CoffeesClass(
      id: "6",
      name: _baseKey.costaRica.name.tr,
      description: _baseKey.costaRica.description.tr,
      aroma: defaultAroma,

      // name: "Costa Rica",
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      imagePath: "assets/images/costarica.png",
      // weight: ["250gr", "500gr", "1kg"],
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      price: 28,
      height: "1700-200M",
      brewing: defaultBrewing,
      // aroma: "Caramel and Fruits Notes",
      variety: defaultVariety,
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(110, 207, 238, 1),
      gradient: [
        Color.fromRGBO(25, 84, 146, 1),
        Color.fromRGBO(110, 207, 238, 1)
      ],
    ),
  ];
}

List<CoffeesClass> get blendCoffees {
  final _baseKey = _trk.blendCoffess;
  return <CoffeesClass>[
    CoffeesClass(
      id: "7",
      name: _baseKey.christmas.name.tr,
      description: _baseKey.christmas.description.tr,
      aroma: defaultAroma,
      // name: "Christmas Blend",
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      // aroma: "Caramel and Fruits Notes",
      imagePath: "assets/images/christmas_blend.png",
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      price: 20,
      height: "1700-200M",
      brewing: defaultBrewing,
      variety: defaultVariety,
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(235, 105, 103, 1),
      gradient: [
        Color.fromRGBO(177, 38, 45, 1),
        Color.fromRGBO(235, 105, 103, 1)
      ],
    ),
    CoffeesClass(
      id: "8",
      name: _baseKey.christmasDecaf.name.tr,
      description: _baseKey.christmasDecaf.description.tr,
      aroma: defaultAroma,
      brewing: defaultBrewing,
      variety: defaultVariety,

      // name: "Christmas Decaf",
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      imagePath: "assets/images/christmas_decaf.png",
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      price: 18,
      height: "1700-200M",

      // aroma: "Caramel and Fruits Notes",
      // variety: "Doairri",
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(73, 153, 114, 1),
      gradient: [
        Color.fromRGBO(20, 109, 84, 1),
        Color.fromRGBO(80, 200, 99, 1)
      ],
    ),
    CoffeesClass(
      id: "9",
      name: _baseKey.espressoRoast.name.tr,
      description: _baseKey.espressoRoast.description.tr,
      aroma: defaultAroma,
      brewing: defaultBrewing,
      variety: defaultVariety,
      // name: "Espresso Roast",
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      imagePath: "assets/images/espresso_roast_vintage.png",
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      price: 35,
      height: "1700-200M",
      // aroma: "Caramel and Fruits Notes",
      // variety: defaultVariety,
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(235, 105, 103, 1),
      gradient: [
        Color.fromRGBO(132, 62, 60, 1),
        Color.fromRGBO(235, 105, 103, 1)
      ],
    ),
    CoffeesClass(
      id: "10",
      name: _baseKey.holiday.name.tr,
      description: _baseKey.holiday.description.tr,
      aroma: defaultAroma,
      brewing: defaultBrewing,
      variety: defaultVariety,
      // name: "Holiday Blend",
      // description:
      //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
      imagePath: "assets/images/holiday_blend.png",
      weight: [250.grFormat, 500.grFormat, 1.kgFormat],
      piece: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
      price: 35,
      height: "1700-200M",
      // aroma: "Caramel and Fruits Notes",
      grinding: commonGrinding,
      bgColor: Color.fromRGBO(228, 206, 180, 1),
      gradient: [
        Color.fromRGBO(186, 140, 97, 1),
        Color.fromRGBO(228, 206, 180, 1)
      ],
    ),
  ];
}
