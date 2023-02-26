import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//this to paint hexagon as cart
class HexagonPainter extends CustomPainter {
  //©Rakibul Islam
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, size.height * 3 / 4);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height * 3 / 4);
    path.lineTo(0, size.height / 4);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.indigoAccent);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}