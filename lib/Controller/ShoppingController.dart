import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/utils/app_utils.dart';
import 'package:get/get.dart';

class CartItemModel {
  CoffeesClass coffee;
  int count;
  double price;
  String grind;
  String uniqueId;

  CartItemModel({
    required this.uniqueId,
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
  var products = <String, CartItemModel>{}.obs;

  addProduct(String incomingId, CoffeesClass item, int quantity, double price, String? grind) {
    String uniqueId = item.id + item.brewing;
    item.id = uniqueId;

    products[uniqueId] = CartItemModel(
      uniqueId: uniqueId,
      coffee: item,
      count: quantity,
      price: price,
      grind: grind ?? '',
    );

    update();
  }

  plusProduct(CartItemModel item) {
    String uniqueId = item.uniqueId;

    products[uniqueId]!.count++;
    update();
  }

  minusProduct(CartItemModel item) {
    String uniqueId = item.uniqueId;

    products[uniqueId]!.count--;
    update();
  }

  int get totalCartItems {
    return products.keys.length;
  }

  CartItemModel getItem(int idx) {
    return products.values.toList()[idx];
  }
}

class PieceController extends GetxController {
  var totalPiece = 0.obs;

  String get quantityString {
    return totalPiece().toString();
  }

  void addQuantity(int piece) {
    totalPiece.value += piece;
  }

  void minusQuantity(int piece) {
    totalPiece.value -= piece;
  }

  increaseProductPiece(products, coffee) {
    var _products = products.obs;
    var uniqueId = coffee.coffee.id + coffee.coffee.brewing;

    products[uniqueId].count = coffee.count + 1;
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
