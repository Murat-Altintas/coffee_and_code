import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/MainPage.dart';
import 'package:coffee_and_code/View/MainScreens/ProductInfo/TopSpecs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <String, CartItem>{}.obs;
 // var grindMap = {};


  void addProduct(CoffeesClass item, int piece,String grind ) {
      products[item.id] = CartItem(item, piece, grind);
  }
}

class CartItem {
  CoffeesClass coffee;
  int count;
  String grind;
  CartItem(this.coffee,this.count,this.grind);

}
class BasketController extends GetxController {
  var cartBasket = 0.obs;

  void plusBasket() {
    cartBasket++;
    update();
  }

  void minusBasket() {
    cartBasket--;
    update();
  }
}

class TotalPiece extends GetxController {
  var totalPiece = 0.obs;

  plusPiece(piece) {
    return totalPiece + piece;
  }

  void minusPiece() {
    totalPiece--;
    update();
  }
}

class TotalCoffeePiece extends GetxController {
  //var _priceList = List.filled(0, 0).obs;
  var newPrice = 0;

  returnNewPrice({int price, int piece})  {
    //"[] and {} optional"
    return newPrice = price * piece;
  }
}

class SelectedProductColor {
  List<Color> colorList = [];

  returnColor(Color color) {
    return colorList.add(color);
  }
}

class NewPrice extends GetxController {
  var newPrice = 0.obs;
}

class SelectedGrinding {
  //var newGrinding = "Select Grind".obs;
  //var _priceList = List.filled(0, 0).obs;
  var newGrinding;
  List<String> grindList = [];
  returnNewGrinding(String newGrinding) {
    return newGrinding = newGrinding;
  }
}
