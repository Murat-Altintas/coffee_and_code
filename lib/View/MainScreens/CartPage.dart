import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartPage extends StatefulWidget {
  final newProductPiece = Get.put(ShoppingController());
  final totalPiece = Get.put(PieceController());
  final CoffeesClass? coffeesClass;

  CartPage({Key? key, this.coffeesClass}) : super(key: key);

  @override
  State createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {
  int plusPiece = 1;

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController());
    final mainTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CART PAGE",
          style: TextStyle(fontSize: context.height2 * 3),
        ),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          tapBodyToExpand: true,
          tapHeaderToExpand: true,
          tapBodyToCollapse: true,
        ),
        child: ListView(
            physics: const BouncingScrollPhysics(),
            children: shoppingController.products
                .map(
                  (id, element) => MapEntry(
                    id,
                    Card(
                      margin: EdgeInsets.all(20),
                      color: Colors.white,
                      elevation: 5,
                      child: ExpandableNotifier(
                          child: ScrollOnExpand(
                        child: Padding(
                          padding: context.paddingMedium,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: context.height2 * 2,
                              ),
                              Expandable(
                                collapsed: Container(
                                  height: context.height2 * 22,
                                  width: context.width2 * 100,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: element.coffee.bgColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            height: context.height2 * 18,
                                            width: context.width2 * 30,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Image.asset(
                                                element.coffee.imagePath,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: context.width2 * 5,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: context.width2 * 25,
                                                    child: Text(
                                                      element.coffee.name,
                                                      style: mainTheme
                                                          .textTheme.subtitle1,
                                                    ),
                                                  ),
                                                  Text(
                                                    element.grind,
                                                    style: mainTheme
                                                        .textTheme.headline3,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        context.lowestContainer,
                                                  ),
                                                  Text(
                                                    element.price.toString() +
                                                        "€",
                                                    style: mainTheme
                                                        .textTheme.headline5,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: context.lowestContainer,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Button(
                                                    width: context.lowContainer,
                                                    height:
                                                        context.lowContainer,
                                                    buttonColor: mainTheme
                                                        .primaryColorLight,
                                                    buttonShadowColor: mainTheme
                                                        .primaryColorLight,
                                                    child: Text(
                                                      "+",
                                                      style: mainTheme
                                                          .textTheme.subtitle1,
                                                    ),
                                                    onTap: () {
                                                      // widget.newProductPiece;
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: context.height2 * 1,
                                                  ),
                                                  /*
                                                  GetX(
                                                    builder: (_) => Text(
                                                      widget.newProductPiece
                                                          .cartCount
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  */
                                                  element.count < 0
                                                      ? Text(
                                                          "0",
                                                          style: mainTheme
                                                              .textTheme
                                                              .headline4,
                                                        )
                                                      : Text(
                                                          element.count
                                                              .toString(),
                                                          style: mainTheme
                                                              .textTheme
                                                              .headline4,
                                                        ),
                                                  SizedBox(
                                                    height: context.height2 * 1,
                                                  ),
                                                  Button(
                                                    width: context.lowContainer,
                                                    height:
                                                        context.lowContainer,
                                                    buttonColor: mainTheme
                                                        .primaryColorLight,
                                                    buttonShadowColor: mainTheme
                                                        .primaryColorLight,
                                                    child: Text(
                                                      "-",
                                                      style: mainTheme
                                                          .textTheme.subtitle1,
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        shoppingController
                                                            .products[element
                                                                .coffee.id]!
                                                            .count = element
                                                                .count -
                                                            1;
                                                        if (widget
                                                                .totalPiece
                                                                .totalPiece
                                                                .value !=
                                                            0) {
                                                          widget.totalPiece
                                                              .increaseCartPiece(
                                                                  -1);
                                                        }
                                                      });

                                                      //widget.productCount.minusBasket();
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                expanded: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              element.coffee.name,
                                              style:
                                                  mainTheme.textTheme.subtitle1,
                                            ),
                                            Text(
                                              element.grind,
                                              style:
                                                  mainTheme.textTheme.headline3,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            element.count < 0
                                                ? Text(
                                                    "0",
                                                    style: mainTheme
                                                        .textTheme.headline4,
                                                  )
                                                : Text(
                                                    element.count.toString(),
                                                    style: mainTheme
                                                        .textTheme.headline4,
                                                  ),
                                            Text(
                                              element.price.toString() + "€",
                                              style:
                                                  mainTheme.textTheme.headline5,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Builder(
                                    builder: (context) {
                                      final controller =
                                          ExpandableController.of(context)!;
                                      return TextButton(
                                        child: Text(
                                          controller.expanded
                                              ? "EXPAND"
                                              : "COLLAPSE",
                                          style: mainTheme.textTheme.subtitle1,
                                        ),
                                        onPressed: () {
                                          controller.toggle();
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                )
                .values
                .toList()),
      ),
    );
  }
}

/*
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: shoppingController.products
              .map(
                (element, piece) => MapEntry(
                  element,
                  Row(
                    children: [
                      Container(
                        height: 50,
                        child: Image.asset(element.imagePath),
                      ),
                      Text(element.name),
                    ],
                  ),
                ),
              )
              .values
              .toList(),

          // Card2(),
        ),
      ),
 */

/*
class Card2 extends StatefulWidget {
  @override
  _Card2State createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expandable(
                collapsed: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: shoppingController.products
                            .map(
                              (element, piece) => MapEntry(
                                element,
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Image.asset(element.imagePath),
                                    ),
                                    Text(element.name),
                                  ],
                                ),
                              ),
                            )
                            .values
                            .toList(),
                      ),
                    ),
                  ],
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Expandable",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var controller = ExpandableController.of(context);
                      return TextButton(
                        child: Text(
                          controller.expanded ? "EXPAND" : "COLLAPSE",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.deepPurple),
                        ),
                        onPressed: () {
                          controller.toggle();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
 */
