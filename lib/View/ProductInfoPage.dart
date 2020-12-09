import 'package:coffee_and_code/Components/ProductBackShape.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

class ProductInfoPage extends StatefulWidget {
  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(
              Size.infinite.width,
              context.height2 * 60,
            ),
            painter: ProductBackShape(mainTheme.primaryColorLight),
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
