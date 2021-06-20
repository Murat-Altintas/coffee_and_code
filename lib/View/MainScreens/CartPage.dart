import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:coffee_and_code/Components/Buttons.dart';
import 'package:coffee_and_code/Components/ProductBackShape.dart';
import 'package:coffee_and_code/Controller/ShoppingController.dart';
import 'package:coffee_and_code/Repository/Coffees.dart';
import 'package:coffee_and_code/View/MainScreens/CartPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //UniqueKey keyTile;
  bool expandable = false;
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Page"),
        ),
        body: SingleChildScrollView(
          //physics: BouncingScrollPhysics(),
          child: ExpansionPanelList.radio(
            expansionCallback: (index, isExpanded) {
              final tile = shoppingController;
              setState(() => tile.isExpanded = isExpanded);
            },
            children: shoppingController.products
                .map(
                  (element, piece) => MapEntry(
                    element,
                    ExpansionPanelRadio(
                      backgroundColor: Colors.blueGrey,
                      value: shoppingController.products.length,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return Text(element.name, style: TextStyle(color: Colors.white));
                      },
                      body: Row(
                        children: [
                          Text(
                            element.piece.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ));
  }

  void expandTile() {
    setState(() {
      expandable = true;
      //keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      expandable = false;
      //keyTile = UniqueKey();
    });
  }
}

/*

class CartPage extends StatefulWidget {

  final shoppingController = Get.put(ShoppingController());

  @override
  State createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Expandable Demo", style: TextStyle(fontSize: context.height2 * 3),),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Card2(),
          ],
        ),
      ),
    );
  }
}

class Card2 extends StatefulWidget {
  @override
  _Card2State createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    final mainTheme = Theme.of(context);
    buildImg(Color color, double height) {
      return SizedBox(
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
            ),
          ));
    }

    buildCollapsed1(context) {
      final shoppingController = Get.put(ShoppingController());
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: shoppingController.products
                  .map(
                    (element, piece) => MapEntry(
                      element,
                      Row(
                        children: [
                          Container(
                            child: Image.asset(element.imagePath),
                          ),
                          Text(element.name),
                        ],
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ),
        ],
      );
    }

    buildExpanded1(context) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Expandable",
              ),
            ],
          ),
        ),
      ]);
    }

    return ExpandableNotifier(

        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expandable(
                collapsed: buildCollapsed1(context),
                expanded: buildExpanded1(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      var controller = ExpandableController.of(context);
                      return TextButton(
                        child: Text(
                          controller.expanded ? "EXPAND" : "COLLAPSE",
                          style: Theme.of(context).textTheme.button.copyWith(color: Colors.deepPurple),
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
      ),
    ));
  }
}

 */
