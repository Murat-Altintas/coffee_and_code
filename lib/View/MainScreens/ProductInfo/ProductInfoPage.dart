import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/i18n/i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'BottomSpecs.dart';
import 'TopSpecs.dart';

class ProductInfoPage extends StatefulWidget {
  final CoffeesClass coffeesClass;

  ProductInfoPage(this.coffeesClass);

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  static final _trk = TKeys.view.mainScreens.productInfo.productInfoPage;
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            TopSpecs(widget.coffeesClass, context),
            Positioned(
              top: context.height2 * 69,
              left: context.width2 * 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // "Overview",
                        _trk.overview.tr,
                        style: mainTheme.textTheme.headline2,
                      ),
                      SizedBox(
                        height: context.height2 * 2,
                      ),
                      BottomSpecs(
                          // title: "AROMA",
                          title:_trk.aroma.tr,
                          subtitle: widget.coffeesClass.aroma,
                          icon: Icons.free_breakfast),
                      SizedBox(
                        height: context.height2 * 2,
                      ),
                      BottomSpecs(
                          title:_trk.brewing.tr,
                          // title: "BREWİNG",
                          subtitle: widget.coffeesClass.brewing,
                          icon: Icons.free_breakfast),
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
                      BottomSpecs(
                          // title: "HEIGHT",
                          title: _trk.height.tr,
                          subtitle: widget.coffeesClass.height,
                          icon: Icons.free_breakfast),
                      SizedBox(
                        height: context.height2 * 2,
                      ),
                      BottomSpecs(
                          // title: "VARIETY",
                          title: _trk.variety.tr,
                          subtitle: widget.coffeesClass.variety,
                          icon: Icons.free_breakfast),
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
