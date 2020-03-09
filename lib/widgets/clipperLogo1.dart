import 'package:flutter/material.dart';

class TriangleClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 10);

    path.lineTo(size.width, size.height - 5);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper1 oldClipper) => false;
}
