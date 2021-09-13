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

import 'cart_item.dart';

class CartPage extends StatefulWidget {
  final newProductPiece = Get.put(ShoppingController());
  final totalPieceController = Get.put(PieceController());
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
        child: ListView.builder(
          itemBuilder: (_, idx) => CartCardItem(
            model: shoppingController.getItem(idx),
          ),
          itemCount: shoppingController.totalCartItems,
        ),
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
