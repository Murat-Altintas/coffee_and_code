import 'TopSpecs.dart';
import 'file:///C:/Users/murat/Desktop/coffee_and_code/lib/View/MainScreens/ProductInfo/BottomSpecs.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/rendering.dart';

class ProductInfoPage extends StatefulWidget {
  final CoffeesClass coffeesClass;

  ProductInfoPage(this.coffeesClass);

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            TopSpecs(widget.coffeesClass),
            Positioned(
              top: context.height2 * 67,
              left: context.width2 * 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Overview", style: mainTheme.textTheme.headline2),
                      SizedBox(
                        height: context.height2 * 2,
                      ),
                      BottomSpecs(title: "AROMA", subtitle: widget.coffeesClass.aroma, icon: Icons.free_breakfast),
                      SizedBox(
                        height: context.height2 * 2,
                      ),
                      BottomSpecs(title: "BREWİNG", subtitle: widget.coffeesClass.brewing, icon: Icons.free_breakfast),
                    ],
                  ),
                  SizedBox(
                    width: context.width2 * 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.height2 * 5,
                      ),
                      BottomSpecs(title: "HEIGHT", subtitle: widget.coffeesClass.height, icon: Icons.free_breakfast),
                      SizedBox(
                        height: context.height2 * 2,
                      ),
                      BottomSpecs(title: "VARIETY", subtitle: widget.coffeesClass.variety, icon: Icons.free_breakfast),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
