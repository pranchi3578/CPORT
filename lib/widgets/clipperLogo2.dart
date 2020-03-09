import 'package:flutter/material.dart';

class TriangleClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);

    path.lineTo(-size.width, size.height - 5);
    path.lineTo(-size.width, 15);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper2 oldClipper) => false;
}
