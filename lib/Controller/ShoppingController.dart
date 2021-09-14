import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/utils/app_utils.dart';
import 'package:get/get.dart';

class CartItemModel {
  CoffeesClass coffee;
  int count;
  double price;
  String grind;

  CartItemModel({
    required this.coffee,
    required this.count,
    required this.price,
    required this.grind,
  });

  String get formatPrice {
    return LocaleUtils.formatPrice(price);
  }
}

class ShoppingController extends GetxController {
  var products = <String, CartItemModel>{};

  addProduct(CoffeesClass item, int piece, double price, String? grind) {
    products[item.id] = CartItemModel(
      coffee: item,
      count: piece,
      price: price,
      grind: grind ?? '',
    );
  }

  int get totalCartItems => products.keys.length;

  CartItemModel getItem(int idx) {
    return products.values.toList()[idx];
  }
}

class PieceController extends GetxController {
  var totalPiece = 0.obs;

  String get quantityString => totalPiece().toString();

  void addQuantity(int piece) {
    totalPiece.value += piece;
  }

  increaseProductPiece(products, coffee) {
    var _products = products.obs;
    products[coffee.coffee.id].count = coffee.count + 1;
    return _products;
  }
}

class TotalCoffeePrice {
  var newPrice = 0;

  returnNewPrice({
    required int price,
    required int piece,
  }) {
    //"[] and {} for optional choice"
    return newPrice = price * piece;
  }
}
