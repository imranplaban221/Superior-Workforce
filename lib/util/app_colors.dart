import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors{
  
  static Color primaryColor=const Color(0xFF0074BE);
  static Color backgroundColor=const Color(0xFFF7F9FC);
  static Color cardColor = const Color(0xFFFFFFFF);
  static Color cardLightColor = const Color(0xFF555555);
  static Color borderColor = const Color(0xFF27AE60);
  static Color textColor = const Color(0xFFFFFFFF);
  static Color subTextColor = const Color(0xFFE8E8E8);
  static Color hintColor = const Color(0xFFB5B5B5);
  static Color greyColor = const Color(0xFFB5B5B5);
  static Color fillColor = const Color(0xFFFFFFFF);
  static Color dividerColor = const Color(0xFF555555);
  static Color shadowColor = const Color(0xFF2B2A2A);
  static Color bottomBarColor = const Color(0xFF343434);
  static const LinearGradient buttonColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: <double>[0.0144, 1.0],
    colors: <Color>[
      Color(0xFF004A8F),
      Color(0xFF008290),
    ],
  );
  
  static const MaterialColor blackSwatch = MaterialColor(
    0xFF0E1B2A,
    <int, Color>{
      50: Color(0xFFE7E8EA),
      100: Color(0xFFB4B8BD),
      200: Color(0xFF90969D),
      300: Color(0xFF5E6670),
      400: Color(0xFF3E4955),
      500: Color(0xFF0E1B2A),
      600: Color(0xFF0D1926),
      700: Color(0xFF0A131E),
      800: Color(0xFF080F17),
      900: Color(0xFF060B12),
    },
  );

  static BoxShadow shadow=BoxShadow(
    blurRadius: 4,
    spreadRadius: 0,
    color: shadowColor,
    offset: const Offset(0, 2),
  );
}
