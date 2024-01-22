import 'package:flutter/material.dart';

class AppColor {
  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  static const Color _blue = Colors.blue;
  static const Color _grey = Colors.grey;
  static const Color _red = Colors.red;
  static const Color _mainColors = Color(0xFFC67C4E);
  static const List<Color> _gradientMainColors = [
    Color(0xffc67c4e),
    Color(0xffecaa81)
  ];

  static late Color background;
  static late Color black;
  static late Color white;
  static late Color grey;
  static late Color textColor;
  static late Color buttonColor;
  static late Color red;
  static late Color icon;
  static late Color buttonTextColor;
  static late Color mainColors;
  static late List<Color> gradientMainColors;

  static void loadLight() {
    background = _white;
    black = _black;
    white = _white;
    textColor = _black;
    buttonTextColor = _white;
    buttonColor = _blue;
    grey = _grey;
    red = _red;
    icon = _black;
    mainColors = _mainColors;
    gradientMainColors = _gradientMainColors;
  }
}
