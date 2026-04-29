import 'package:flutter/material.dart';



class CurvePainter extends CustomPainter {
 
  @override
 
  void paint(Canvas canvas, Size size) {
 
    final paint = Paint()
 
      ..color = const Color(0xFF0074BE)
 
      ..style = PaintingStyle.fill;
 
    final path = Path();
 
    // Start from bottom-left
 
    path.moveTo(0, size.height);
 
    // Draw cubic curve to bottom-right
 
    path.cubicTo(
 
      size.width * (0.5),  // control point 1 x
 
      size.height * (0.8), // control point 1 y
 
      size.width * (272.896 / 430),  // control point 2 x
 
      size.height * (440.549 / 503), // control point 2 y
 
      size.width,                    // end x
 
      size.height,                   // end y
 
    );
 
    // Close the shape upwards if needed
 
    path.lineTo(size.width, 0);
 
    path.lineTo(0, 0);
 
    path.close();
 
    canvas.drawPath(path, paint);
 
  }
 
  @override
 
  bool shouldRepaint(CustomPainter oldDelegate) => true;
 
}