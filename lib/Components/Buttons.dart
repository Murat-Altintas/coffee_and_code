import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/widgets.dart';

class Button extends StatefulWidget {
  final buttonColor;
  final buttonShadowColor;
  final onTap;
  final height;
  final width;
  final child;

  const Button(
      {Key? key,
      required this.buttonColor,
      required this.buttonShadowColor,
      required this.onTap,
      required this.height,
      required this.width,
      required this.child})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 200),
    lowerBound: 0.2,
    upperBound: 0.44,
  )..addListener(() {
    setState(() {});
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final mainTheme = Theme.of(context);
    _scale = 1.2 - _controller.value;
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          child: Center(
            child: widget.child,
          ),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: widget.buttonShadowColor,
                blurRadius: context.width2 * 3,
                offset: Offset(3, 3),
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {

    _controller.reverse();
  }
}
