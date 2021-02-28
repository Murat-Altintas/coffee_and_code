import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ProductBackShape.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../SecondLeftBar.dart';

class TopSpecs extends StatefulWidget {
  TopSpecs(this.coffeesClass);

  final CoffeesClass coffeesClass;

  final basketController = Get.put(BasketController());

  @override
  _TopSpecsState createState() => _TopSpecsState();
}

class _TopSpecsState extends State<TopSpecs> {
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    String selectedWeight = "test1";

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

                        //Get.to(ShoppingPage());
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
                      child: GetX<BasketController>(
                        builder: (_) => Text(
                          "${widget.basketController.addBasket}",
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
                  child: Text(widget.coffeesClass.name,
                      style: mainTheme.textTheme.headline6)),
              SizedBox(
                height: context.lowestContainer,
              ),
              Text("PRICE", style: mainTheme.primaryTextTheme.headline1),
              SizedBox(
                height: context.height2 * 1.5,
              ),
              Text(widget.coffeesClass.price.toString() + "€",
                  style: mainTheme.primaryTextTheme.headline2),
              SizedBox(
                height: context.lowContainer,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("WEIGHT",
                          style: mainTheme.primaryTextTheme.headline1),
                      DropdownButton<String>(
                        dropdownColor: mainTheme.primaryColorDark,
                        items: [
                          //for (int i = 0; i < widget.coffeesClass.weight.length; i++)
                          DropdownMenuItem(
                            child: Text("test1",
                                style: mainTheme.primaryTextTheme.headline2),
                            value: "test1",
                          ),
                          DropdownMenuItem(
                            child: Text("test2",
                                style: mainTheme.primaryTextTheme.headline2),
                            value: "demo",
                          ),
                          DropdownMenuItem(
                            child: Text("test3",
                                style: mainTheme.primaryTextTheme.headline2),
                            value: "dem",
                          ),
                        ],
                        onChanged: (String selected) {
                          setState(() {
                            selectedWeight = selected;
                          });
                        },
                        value: selectedWeight,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: context.lowestContainer,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("PIECE",
                          style: mainTheme.primaryTextTheme.headline1),
                      DropdownButton<String>(
                        dropdownColor: mainTheme.primaryColorDark,
                        items: [
                          //for (int i = 0; i < widget.coffeesClass.weight.length; i++)
                          DropdownMenuItem(
                            child: Text("test1",
                                style: mainTheme.primaryTextTheme.headline2),
                            value: "test1",
                          ),
                          DropdownMenuItem(
                            child: Text("test2",
                                style: mainTheme.primaryTextTheme.headline2),
                            value: "demo",
                          ),
                          DropdownMenuItem(
                            child: Text("test3",
                                style: mainTheme.primaryTextTheme.headline2),
                            value: "dem",
                          ),
                        ],
                        onChanged: (String selected) {
                          setState(() {
                            selectedWeight = selected;
                          });
                        },
                        value: selectedWeight,
                      ),
                    ],
                  ),
                ],
              ),
              /*
              Text(widget.coffeesClass.weight.toString(),
                  style: mainTheme.primaryTextTheme.headline2),
              
              */

              SizedBox(
                height: context.lowContainer,
              ),
              Text("GRINDING", style: mainTheme.primaryTextTheme.headline1),
              DropdownButton<String>(
                dropdownColor: mainTheme.primaryColorDark,
                items: [
                  //for (int i = 0; i < widget.coffeesClass.weight.length; i++)
                  DropdownMenuItem(
                    child: Text("test1",
                        style: mainTheme.primaryTextTheme.headline2),
                    value: "test1",
                  ),
                  DropdownMenuItem(
                    child: Text("test2",
                        style: mainTheme.primaryTextTheme.headline2),
                    value: "demo",
                  ),
                  DropdownMenuItem(
                    child: Text("test3",
                        style: mainTheme.primaryTextTheme.headline2),
                    value: "dem",
                  ),
                ],
                onChanged: (String selected) {
                  setState(() {
                    selectedWeight = selected;
                  });
                },
                value: selectedWeight,
              ),
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
                widget.basketController.plusBasket();
              },
              height: context.height2 * 7,
              width: context.width2 * 14),
        ),
      ],
    );
  }
}
