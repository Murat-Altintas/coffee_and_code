import 'package:flutter/material.dart';

class ProductInfoWidget extends StatefulWidget {
  @override
  _ProductInfoWidgetState createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Info Page"),
      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
