import 'dart:convert';

import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/MainPage.dart';
import 'package:coffee_and_code/View/MainScreens/ProductInfo/TopSpecs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartItem {
  CoffeesClass coffee;
  int count, price;
  String grind;

  CartItem({this.coffee, this.count, this.price, this.grind});
}

class ShoppingController extends GetxController {
  var products = <String, CartItem>{}.obs;

  addProduct(CoffeesClass item, int piece, price, String grind) {
    products[item.id] =
        CartItem(coffee: item, count: piece, price: price, grind: grind);
  }

/*
  plusProduct(newCount) {
    return cartCount + newCount;
  }
   */

}

class PieceController extends GetxController {
  var totalPiece = 0.obs;

  increaseCartPiece(piece) {
    return totalPiece + piece;
  }

  increaseProductPiece(products, coffee) {
    var _products = products.obs;

    products[coffee.coffee.id].count = coffee.count +1;

    return _products;
  }
}

class TotalCoffeePrice {
  var newPrice = 0;

  returnNewPrice({int price, int piece}) {
    //"[] and {} for optional choice"
    return newPrice = price * piece;
  }
}
