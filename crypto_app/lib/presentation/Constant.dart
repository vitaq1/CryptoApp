import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constant {
  static const kPurpleColor = Color(0XFF6552FE);
  static const kDarkColor = Color(0XFF070707);
  static const kGrayColor = Color(0XFF1F1F1F);
  static const kLightGrayColor = Color(0XFF6C757D);
  static const kNavColor = Color(0XFF121212);
  static const kCashColor = Color(0XFFF7DABB);
  static const kCardColor = Color(0XFF18181C);

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static var lightTheme = ThemeData(
      fontFamily: "Poppins",
      colorScheme: const ColorScheme.light()
          .copyWith(background: CupertinoColors.extraLightBackgroundGray),
      textTheme: TextTheme(headlineLarge: TextStyle(color: Colors.black87)),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light().copyWith(background: Colors.black54)));

  static var darkTheme = ThemeData(
      fontFamily: "Poppins",
      colorScheme: const ColorScheme.dark()
          .copyWith(background: CupertinoColors.darkBackgroundGray),
      textTheme: TextTheme(headlineLarge: TextStyle(color: Colors.white)),
      buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.dark().copyWith(background: kGrayColor)));

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
