import 'dart:ui';

import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartCardItem extends StatelessWidget {
  final CartItemModel model;

  CartCardItem({Key? key, required this.model}) : super(key: key);
  final ShoppingController shoppingController = Get.find();
  final totalPiece = Get.put(PieceController());

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(20),
      color: Colors.white,
      elevation: 15,
      child: ExpandableNotifier(
          child: ScrollOnExpand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expandable(
              collapsed: Builder(builder: (context) {
                final controller = ExpandableController.of(context)!;
                return GestureDetector(
                  onTap: () {
                    controller.toggle();
                  },
                  child: Container(
                    height: context.height2 * 22,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: model.coffee.bgColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: context.height2 * 22,
                            width: context.width2 * 25,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Image.asset(
                                model.coffee.imagePath,
                              ),
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              GetBuilder<ShoppingController>(
                                  init: ShoppingController(),
                                  builder: (controller) {
                                    return Text(
                                      "${model.formatPrice}",
                                      style: mainTheme.textTheme.headline5,
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: GetBuilder<ShoppingController>(
                              init: ShoppingController(),
                              builder: (controller) {
                                return shoppingController
                                            .products[model.uniqueId]!.count <
                                        0
                                    ? Text("0")
                                    : Text(
                                        "${controller.products[model.uniqueId]!.count}",
                                        style: mainTheme.textTheme.headline4,
                                      );
                              }),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: context.height2 * 3,
                                ),
                                _ActionButton(
                                    label: '+',
                                    onTap: () {
                                      totalPiece.addQuantity(int.parse(
                                          "${model.uniqueId.replaceFirst(model.uniqueId, "1")}"));
                                      shoppingController.plusProduct(
                                          model, model.price);
                                      print(model.grind);
                                    }),
                                SizedBox(
                                  height: context.lowestContainer,
                                ),
                                _ActionButton(
                                    label: '-',
                                    onTap: () {
                                      totalPiece.minusQuantity(int.parse(
                                          "${model.uniqueId.replaceFirst(model.uniqueId, "1")}"));
                                      shoppingController.minusProduct(model);
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              expanded: Builder(builder: (context) {
                final controller = ExpandableController.of(context)!;
                return GestureDetector(
                  onTap: () {
                    controller.toggle();
                  },
                  child: Column(
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
                              SizedBox(
                                height: context.height2 * 2,
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
                              SizedBox(
                                height: context.height2 * 2,
                              ),
                              Text(
                                model.formatPrice,
                                style: mainTheme.textTheme.headline5,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height2 * 2,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
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
      buttonColor: Colors.white,
      buttonShadowColor: Colors.black12,
      child: Text(
        label,
        style: mainTheme.textTheme.subtitle1!
            .copyWith(fontWeight: FontWeight.w800),
      ),
      onTap: onTap,
    );
  }
}
