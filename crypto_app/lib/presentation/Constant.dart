import 'dart:ui';

class Constant {

  static const kPurpleColor = Color(0XFF6552FE);
  static const kDarkColor = Color(0XFF070707);
  static const kGrayColor = Color(0XFF1F1F1F);
  static const kLightGrayColor = Color(0XFF6C757D);
  static const kNavColor = Color(0XFF121212);
  static const kCashColor = Color(0XFFF7DABB);
  static const kCardColor = Color(0XFF18181C);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
