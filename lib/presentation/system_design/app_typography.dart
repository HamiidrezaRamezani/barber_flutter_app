import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static TextStyle heading({Color color = Colors.black}) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "bold",
        color: color,
      );

  static TextStyle subheading({Color color = Colors.black}) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: "bold",
        color: color,
      );

  static TextStyle body({Color color = Colors.black}) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: "regular",
        color: color,
      );

  static TextStyle caption({Color color = Colors.grey}) => TextStyle(
        fontSize: 14,
        fontFamily: "medium",
        color: color,
      );

  static TextStyle button({Color color = Colors.white}) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: "medium",
        color: color,
      );
}
