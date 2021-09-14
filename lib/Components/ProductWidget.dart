import 'package:coffee_and_code/Components/CoffeScene.dart';
import 'package:coffee_and_code/Components/CoffeeDescriptionScene.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/ProductInfo/ProductInfoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ContextExtension.dart';
import 'package:get/get.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget(this.coffeesClass);

  final CoffeesClass coffeesClass;
  final shoppingController = Get.put(ShoppingController());

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return SizedBox(
      height: context.height * 70,
      child: GestureDetector(
        onTap: () {
          Get.to(ProductInfoPage(widget.coffeesClass));
        },
        child: Stack(
          children: [
            Positioned(
              top: context.height2 * 20,
              child: Container(
                  height: context.height2 * 40,
                  width: context.width2 * 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: widget.coffeesClass.gradient,
                      ))),
            ),
            Positioned(
              left: context.width2 * 20,
              child: Container(
                height: context.height2 * 35,
                // color: Colors.red,
                child: Image.asset(widget.coffeesClass.imagePath),
              ),
            ),
            Positioned(
              top: context.height2 * 33,
              //  child: Image.asset(widget.coffeesClass.imagePath),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coffeesClass.name,
                      style: mainTheme.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: context.width2 * 60,
                      child: Column(
                        children: [
                          Text(
                            widget.coffeesClass.description,
                            style: mainTheme.textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.coffeesClass.priceCurrency,
                                // widget.coffeesClass.price.toString() + "€",
                                style: mainTheme.textTheme.bodyText1,
                              ),
                              Text(
                                widget.coffeesClass.weight.first,
                                style: mainTheme.textTheme.bodyText1,
                              ),
                              /*
                                Obx(() => Text(
                                    "${widget.shoppingController.products.fold<int>(0, (previousValue, element) => (previousValue + element.price)).toString()}")),

                              Obx(() {
                                var value = 0;
                                for (var element in widget.shoppingController.products) {
                                  value = value + element.price;
                                }
                                return Text(value.toString());
                              })
                               */
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
