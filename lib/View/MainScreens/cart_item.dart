import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartCardItem extends StatelessWidget {
  final CartItemModel model;

  // final VoidCallback onTap;

   CartCardItem({Key? key, required this.model}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Card(
      margin: EdgeInsets.all(20),
      color: Colors.white,
      elevation: 5,
      child: ExpandableNotifier(
          child: ScrollOnExpand(
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: context.height2 * 2),
              Expandable(
                collapsed: Container(
                  height: context.height2 * 22,
                  width: context.width2 * 100,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: model.coffee.bgColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: context.height2 * 18,
                            width: context.width2 * 30,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                model.coffee.imagePath,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.width2 * 5,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: context.width2 * 25,
                                    child: Text(
                                      model.coffee.name,
                                      style: mainTheme.textTheme.subtitle1,
                                    ),
                                  ),
                                  Text(
                                    model.grind,
                                    style: mainTheme.textTheme.headline3,
                                  ),
                                  SizedBox(
                                    height: context.lowestContainer,
                                  ),
                                  Text(
                                    model.formatPrice,
                                    style: mainTheme.textTheme.headline5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: context.lowestContainer,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _ActionButton(label: '+', onTap: () {}),
                                  SizedBox(
                                    height: context.height2 * 1,
                                  ),
                                  model.count < 0
                                      ? Text(
                                          "0",
                                          style: mainTheme.textTheme.headline4,
                                        )
                                      : Text(
                                          model.count.toString(),
                                          style: mainTheme.textTheme.headline4,
                                        ),
                                  SizedBox(
                                    height: context.height2 * 1,
                                  ),
                                  _ActionButton(label: '-', onTap: () {
                                    shoppingController.products[model.coffee.id]!.count;
                                  }),
/*
 shoppingController
                                         .products[element.coffee.id]!
                                           .count = element.count - 1;
                                      if (widget.totalPieceController
                                                .totalPiece.value !=
                                          0) {
                                          widget.totalPieceController
                                            .addQuantity(-1);
 */
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.coffee.name,
                              style: mainTheme.textTheme.subtitle1,
                            ),
                            Text(
                              model.grind,
                              style: mainTheme.textTheme.headline3,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            model.count < 0
                                ? Text(
                                    "0",
                                    style: mainTheme.textTheme.headline4,
                                  )
                                : Text(
                                    model.count.toString(),
                                    style: mainTheme.textTheme.headline4,
                                  ),
                            Text(
                              model.price.toString() + "€",
                              style: mainTheme.textTheme.headline5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      final controller = ExpandableController.of(context)!;
                      return TextButton(
                        child: Text(
                          controller.expanded ? "EXPAND" : "COLLAPSE",
                          style: mainTheme.textTheme.subtitle1,
                        ),
                        onPressed: () {
                          controller.toggle();
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

/// + and - buttons
class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Button(
      width: context.lowContainer,
      height: context.lowContainer,
      buttonColor: mainTheme.primaryColorLight,
      buttonShadowColor: mainTheme.primaryColorLight,
      child: Text(
        label,
        style: mainTheme.textTheme.subtitle1,
      ),
      onTap: onTap,
    );
  }
}
