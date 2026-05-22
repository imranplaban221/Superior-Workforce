import 'package:flutter/material.dart';



class CurvePainter extends CustomPainter {
 
  @override
 
  void paint(Canvas canvas, Size size) {
 
    final paint = Paint()
 
      ..color = const Color(0xFF0074BE)
 
      ..style = PaintingStyle.fill;
 
    final path = Path();
 
    
 
    path.moveTo(0, size.height);
 
    
 
    path.cubicTo(
 
      size.width * (0.5),  
 
      size.height * (0.8), 
 
      size.width * (272.896 / 430),  
 
      size.height * (440.549 / 503), 
 
      size.width,                    
 
      size.height,                   
 
    );
 
    
 
    path.lineTo(size.width, 0);
 
    path.lineTo(0, 0);
 
    path.close();
 
    canvas.drawPath(path, paint);
 
  }
 
  @override
 
  bool shouldRepaint(CustomPainter oldDelegate) => true;
 
}