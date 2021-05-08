import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  //var products = List<CoffeesClass>().obs;

  @override
  void onInit() {
    super.onInit();
    CoffeesClass();
  }
}

class BasketController extends GetxController {
  var addBasket = 0.obs;

  void plusBasket() {
    addBasket++;
  }
}

class DropDownListClass extends GetxController {}
