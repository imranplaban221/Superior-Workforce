import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  
  static const String fontFamily = 'Inter';


  static TextStyle custom({
    double size = 14,
    FontWeight weight = FontWeight.w400,
    Color color = Colors.black,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size.sp, // 📱 responsive
      fontWeight: weight,
      color: color,
      height: height,
    );
  }

 

  static TextStyle heading({
    Color color = Colors.black,
  }) {
    return custom(
      size: 24,
      weight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle body({
    Color color = Colors.black,
  }) {
    return custom(
      size: 14,
      weight: FontWeight.w400,
      color: color,
    );
  }

  static TextStyle small({
    Color color = Colors.grey,
  }) {
    return custom(
      size: 12,
      weight: FontWeight.w400,
      color: color,
    );
  }
}