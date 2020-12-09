import 'package:flutter/material.dart';
import 'package:coffee_and_code/Components/ContextExtension.dart';
import 'package:flutter/widgets.dart';

class SocialMediaButtons extends StatefulWidget {
  final buttonColor;
  final buttonShadowColor;
  final onTap;
  final buttonStyle;
  final socialChild;

  const SocialMediaButtons(
      {Key key,
      @required this.buttonColor,
      @required this.buttonShadowColor,
      @required this.onTap,
      this.buttonStyle,
      this.socialChild})
      : super(key: key);

  @override
  _SocialMediaButtonsState createState() => _SocialMediaButtonsState();
}

class _SocialMediaButtonsState extends State<SocialMediaButtons>
    with SingleTickerProviderStateMixin {
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
    _scale = .8 - _controller.value;

    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: context.width2 * 20,
          height: context.height2 * 10,
          padding: context.paddingSocialIcons,
          child: widget.socialChild,
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
