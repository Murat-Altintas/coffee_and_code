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