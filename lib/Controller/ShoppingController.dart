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

class DropDownBasket extends GetxController {
  var price = 0.obs;
  //var _priceList = List.filled(0, 0).obs;
  get returnPrice => price.value;

  //set returnNewPrice(newPrice) => price.value = newPrice;

  returnNewPrice(int dropDownInt) {
    int newPrice;
    return price.value = newPrice;
  }
}
