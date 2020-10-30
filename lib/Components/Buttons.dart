import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/widgets.dart';

class Button extends StatefulWidget {
  final buttonColor;
  final buttonShadowColor;
  final buttonText;

  const Button({Key key, this.buttonColor, this.buttonShadowColor, this.buttonText}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.2,
      upperBound: 0.3,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final mainTheme = Theme.of(context);
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          child: Padding(
            padding: context.textPadding,
            child: Center(
              child: Text(widget.buttonText,
                style: mainTheme.textTheme.headline2,
              ),
            ),
          ),
          height: context.height * 5,
          width: context.width * 30,
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: widget.buttonShadowColor,
                blurRadius: context.width * 3,
                offset: Offset(0, 5),
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
