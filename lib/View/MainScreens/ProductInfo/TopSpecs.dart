import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ProductBackShape.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/CartPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../SecondLeftBar.dart';

class TopSpecs extends StatefulWidget {
  TopSpecs(this.coffeesClass, context);

  final CoffeesClass coffeesClass;
  final basketController = Get.put(BasketController());
  final totalPiece = Get.put(TotalPiece());
  final shoppingController = Get.put(ShoppingController());

  @override
  _TopSpecsState createState() => _TopSpecsState();
}

class _TopSpecsState extends State<TopSpecs> {
  String dropDownString;
  int dropDownInt = 1;

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: Size(
            Size.infinite.width,
            context.height2 * 92,
          ),
          painter: ProductBackShape(widget.coffeesClass.bgColor),
        ),
        Positioned(
          top: context.height2 * 6,
          child: Material(
            color: widget.coffeesClass.bgColor,
            child: Row(
              children: [
                IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    Get.to(SecondLeftBar());
                  },
                  iconSize: context.iconSmall,
                  color: Colors.black,
                  icon: Icon(Icons.arrow_back_ios_rounded),
                ),
                SizedBox(
                  width: context.width2 * 73,
                ),
                Stack(
                  children: [
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        Get.to(CartPage());
                      },
                      iconSize: context.iconSmall,
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: mainTheme.primaryColorDark,
                      ),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      /*
                      GetX<BasketController>(
                        builder: (_) => Text(
                          "${widget.basketController.cartBasket}",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                       */

                      child: GetX<TotalPiece>(
                        builder: (_) => Text(
                          widget.totalPiece.totalPiece.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                //widget.shoppingController.products.add(widget.coffeesClass);
              ],
            ),
          ),
        ),
        Positioned(
          left: context.width2 * 5,
          top: context.height2 * 14,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.width2 * 40,
                child: Text(widget.coffeesClass.name, style: mainTheme.textTheme.headline6),
              ),
              SizedBox(
                height: context.lowestContainer,
              ),
              //widget.totalCoffeePiece.returnNewPrice(widget.coffeesClass.price, dropDownInt).toString() + "€"
              Text("PRICE", style: mainTheme.primaryTextTheme.headline1),
              SizedBox(
                height: context.height2 * 1.5,
              ),
              Text((widget.coffeesClass.price * dropDownInt).toString() + ("€"), style: mainTheme.primaryTextTheme.headline2),
              SizedBox(
                height: context.lowContainer,
              ),
              Text("PIECE", style: mainTheme.primaryTextTheme.headline1),
              DropdownButton<int>(
                dropdownColor: mainTheme.primaryColorDark,
                value: dropDownInt,
                items: widget.coffeesClass.piece.map((int e) {
                  return DropdownMenuItem(
                    child: Text(e.toString(), style: mainTheme.primaryTextTheme.headline2),
                    value: e,
                  );
                }).toList(),
                onChanged: (int dropDownSelect) {
                  setState(() {
                    dropDownInt = dropDownSelect;
                  });
                },
              ),
              SizedBox(
                height: context.lowContainer,
              ),
              //widget.selectedGrinding.returnNewGrinding(dropDownString)
              Text("GRINDING", style: mainTheme.primaryTextTheme.headline1),
              DropdownButton<String>(
                dropdownColor: mainTheme.primaryColorDark,
                hint: Text("Choose", style: mainTheme.primaryTextTheme.headline2),
                value: dropDownString,
                items: widget.coffeesClass.grinding.map((String e) {
                  return DropdownMenuItem(
                    child: Text(e, style: mainTheme.primaryTextTheme.headline2),
                    value: e,
                  );
                }).toList(),
                onChanged: (String selected) {
                  setState(() {
                    dropDownString = selected;
                  });
                },
              )
            ],
          ),
        ),
        Positioned(
          left: context.width2 * 55,
          top: context.height2 * 15,
          child: Container(
            width: context.width2 * 40,
            child: Image.asset(widget.coffeesClass.imagePath),
          ),
        ),
        Positioned(
          top: context.height2 * 59,
          left: context.width2 * 5,
          child: Button(
              buttonColor: mainTheme.primaryColorDark,
              buttonShadowColor: mainTheme.primaryColorDark,
              child: Lottie.asset(
                "assets/lottie/add_to_cart.json",
              ),
              onTap: () {
                widget.totalPiece.plusPiece(dropDownInt);
                widget.shoppingController.addProduct(widget.coffeesClass,dropDownInt);
              },
              height: context.height2 * 7,
              width: context.width2 * 14),
        ),
      ],
    );
  }
}

/*
 items: widget.coffeesClass.weight.map((e) {
                  return DropdownMenuItem(
                    child: Text(e, style: mainTheme.primaryTextTheme.headline2),
                    value: e,
                  );
                }).toList(),
 */
