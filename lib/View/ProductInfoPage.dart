import 'package:coffee_and_code/Components/ProductBackShape.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

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
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(
                Size.infinite.width,
                context.height2 * 60,
              ),
              painter: ProductBackShape(mainTheme.primaryColorLight),
            ),
            Column(children: [
              Text(widget.coffeesClass.name, style: mainTheme.textTheme.headline4),
              Text(widget.coffeesClass.discription),
              Text(widget.coffeesClass.weight),

            ]
                //singleOrigin.map((e) => Text(e.name)).toList()
                ),
          ],
        ),
      ),
    );
  }
}
