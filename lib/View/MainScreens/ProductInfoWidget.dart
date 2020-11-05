import 'package:coffee_and_code/Repository/BlendCoffees.dart';
import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';

class ProductInfoWidget extends StatefulWidget {
  @override
  _ProductInfoWidgetState createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);

    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          top: context.height * 10,
          left: context.width * 7,
          child: Container(
              height: context.height * 40,
              width: context.width * 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: blendCoffees[0].colors,
                  ))),
        ),
        Positioned(
          top: context.height * -10,
          left: context.width * 28,
          child: Image.asset(
            blendCoffees[0].imagePath,
            height: context.height * 35,
          ),
        ),
        Positioned(
          top: context.height * 23,
          child: Padding(
            padding: context.paddingText,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blendCoffees[0].name,
                  style: mainTheme.textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: context.width * 60,
                  child: Column(
                    children: [
                      Text(
                        blendCoffees[0].discription,
                        style: mainTheme.textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            blendCoffees[0].price.toString() + "€",
                            style: mainTheme.textTheme.bodyText1,
                          ),
                          Text(
                            blendCoffees[0].weight,
                            style: mainTheme.textTheme.bodyText1,
                          ),
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
    );
  }
}
