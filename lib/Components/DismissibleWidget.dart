import 'package:flutter/material.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismissed;

  const DismissibleWidget({
    required this.item,
    required this.child,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
    key: ObjectKey(item),
    background: buildSwipeActionRight(),
    direction: DismissDirection.endToStart,
    child: child,
    onDismissed: onDismissed,
  );

  Widget buildSwipeActionRight() => Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Icon(Icons.delete_forever, color: Colors.red, size: 32),
  );
}
