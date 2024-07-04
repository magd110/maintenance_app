import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    // path.lineTo(0, size.height);

    path.quadraticBezierTo(
      size.width / 2,
      size.height - size.height * 0.5, // تعديل قيمة الانحناء
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
