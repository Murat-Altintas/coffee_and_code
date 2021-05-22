import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/ProductInfo/TopSpecs.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <CoffeesClass>[].obs;

  @override
  void onInit() {
    super.onInit();
    CoffeesClass();
  }
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

class TotalPiece extends GetxController{
  var totalPiece = 0.obs;

  plusPiece(piece) {
    return totalPiece + piece;
  }

  void minusPiece() {
    totalPiece--;
    update();
  }
}

class TotalCoffeePiece{
  //var _priceList = List.filled(0, 0).obs;

  returnNewPrice(int price, int piece) {
    return price * piece;
  }
}

class SelectedGrinding{
  //var _priceList = List.filled(0, 0).obs;

  returnNewGrinding(String newGrinding) {
    return newGrinding;
  }
}

