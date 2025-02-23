import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static TextStyle heading({Color color = Colors.black}) => TextStyle(
        fontSize: 20,
        fontFamily: "bold",
        color: color,
      );

  static TextStyle subheading({Color color = Colors.black}) => TextStyle(
        fontSize: 16,
        fontFamily: "bold",
        color: color,
      );
  static TextStyle subheading6({Color color = Colors.black}) => TextStyle(
    fontSize: 12,
    fontFamily: "bold",
    color: color,
  );

  static TextStyle body({Color color = Colors.black}) => TextStyle(
        fontSize: 14,
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
        fontFamily: "medium",
        color: color,
      );
}
