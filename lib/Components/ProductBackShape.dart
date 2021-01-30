import 'package:flutter/material.dart';

class ProductBackShape extends CustomPainter {
  final backColor;

  ProductBackShape(this.backColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = backColor
      ..style = PaintingStyle.fill;

    Path path_0 = Path();
    path_0.lineTo(size.width * 0, size.height * .7);
    path_0.lineTo(size.width * 1, size.height * 0.55);
    path_0.lineTo(size.width * 1, size.height * 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}