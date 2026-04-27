import 'package:flutter/material.dart';

/// 🎯 SCREEN 1 → Deep bottom curve (grey area)
class BottomCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFEDEDED) // light grey
      ..style = PaintingStyle.fill;

    Path path = Path();

    /// Start from left
    path.moveTo(0, size.height * 0.75);

    /// Deep curve
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.9,
      size.width,
      size.height * 0.75,
    );

    /// Fill bottom
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



/// 🎯 SCREEN 2 → Higher smoother curve (based on your 2nd reference)
class SecondCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFEDEDED) // light grey
      ..style = PaintingStyle.fill;

    Path path = Path();

    /// Start higher
    path.moveTo(0, size.height * 0.7);

    /// Smooth curve
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.85,
      size.width,
      size.height * 0.7,
    );

    /// Fill bottom
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



/// 🔥 OPTIONAL → Blue wave shape (if you still use it)
class BottomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF2683EB) // primary blue
      ..style = PaintingStyle.fill;

    Path path = Path();

    /// Start mid
    path.moveTo(0, size.height * 0.5);

    /// First curve
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.45,
    );

    /// Second curve
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.55,
      size.width,
      size.height * 0.4,
    );

    /// Fill bottom
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}