import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  final selectedProductColor = Get.put(SelectedProductColor());
  final totalPrice = Get.put(TotalCoffeePiece());
  final selectGrind = Get.put(ShoppingController());

  @override
  State createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {
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
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 5,
                                            blurRadius: 5,
                                            offset: Offset(10, 50)),
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  height: context.height2 * 20,
                                  width: context.width2 * 100,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: context.height2 * 1.5,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlueAccent,
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
                                                mainTheme.textTheme.subtitle1,
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                expanded: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 5,
                                            blurRadius: 5,
                                            offset: Offset(10, 50)),
                                      ],
                                      borderRadius: BorderRadius.circular(10)),
                                  height: context.height2 * 10,
                                  width: context.width2 * 100,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: context.height2 * 1.5,
                                      ),
                                      Padding(
                                        padding: context.paddingMedium,
                                        child: Column(
                                          children: [
                                            Text(
                                              element.grind,
                                              style:
                                                  mainTheme.textTheme.subtitle1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Builder(
                                    builder: (context) {
                                      var controller =
                                          ExpandableController.of(context);
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
