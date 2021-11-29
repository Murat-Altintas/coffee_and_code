import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'cart_item.dart';

class CartPage extends StatefulWidget {
  final newProductPiece = Get.put(ShoppingController());
  final CoffeesClass? coffeesClass;
  final ShoppingController shoppingController = Get.find();

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "My Cart",
                style: mainTheme.textTheme.headline4,
              ),
            ),
            Expanded(
              flex: 9,
              child: ExpandableTheme(
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
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5, 0),
                        blurRadius: 20,
                        spreadRadius: 2,
                      )
                    ]),
                child: Padding(
                  padding: context.paddingMedium,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Total Amount",
                              style: mainTheme.textTheme.subtitle2),
                          Text("???", style: mainTheme.textTheme.headline6),
                        ],
                      ),
                      Button(
                        buttonColor: mainTheme.primaryColorLight,
                        buttonShadowColor: mainTheme.primaryColorLight,
                        onTap: () {},
                        height: context.height2 * 5,
                        width: context.width2 * 30,
                        child: Text("Place Order"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}