import 'package:flutter/material.dart';

class AppColor {
  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  static const Color _blue = Colors.blue;
  static const Color _grey = Colors.grey;
  static const Color _red = Colors.red;
  static const Color _mainColors = Color(0xFFC67C4E);
  static const Color _categoryTextColors = Color(0xFF2F4B4E);
  static const Color _backGroundColor = Color(0xFFF9F9F9);
  static const List<Color> _gradientMainColors = [
    Color(0xffc67c4e),
    Color(0xffecaa81)
  ];
  static const Color _titleColor = Color(0xFF2F2D2C);
  static const Color _subtitleColor = Color(0xFF9B9B9B);
  static const Color _dividerColor = Color(0xFFEAEAEA);
  static const Color _lightMainColor = Color(0xFFFFF5EE);

  static late Color black;
  static late Color white;
  static late Color grey;
  static late Color textColor;
  static late Color buttonColor;
  static late Color red;
  static late Color icon;
  static late Color buttonTextColor;
  static late Color mainColors;
  static late Color categoryTextColors;
  static late Color backGroundColor;
  static late List<Color> gradientMainColors;
  static late Color titleColor;
  static late Color subtitleColor;
  static late Color dividerColor;
  static late Color lightMainColor;

  static void loadLight() {
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
    categoryTextColors = _categoryTextColors;
    backGroundColor = _backGroundColor;
    titleColor = _titleColor;
    subtitleColor = _subtitleColor;
    dividerColor = _dividerColor;
    lightMainColor = _lightMainColor;
  }
}
