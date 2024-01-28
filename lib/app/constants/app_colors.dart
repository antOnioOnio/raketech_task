import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color.fromRGBO(23, 30, 49, 1);
  static const Color primary200 = Color.fromRGBO(239, 243, 245, 1);
  static const Color secondary = Color.fromRGBO(38, 174, 251, 1);
  static const Color secondary800 = Color(0xFF35759C);
  static const Color complementary = Color.fromRGBO(231, 244, 248, 1);
  static const Color complementaryDisabled = Color.fromRGBO(216, 184, 236, 1);
  static const Color primaryWhite = Color.fromRGBO(255, 255, 255, 1);
  static const Color semanticInformation = Color.fromRGBO(0, 87, 255, 1);
  static const Color naturalGrey = Color.fromRGBO(86, 95, 105, 1);
  static const Color naturalGrey2 = Color.fromRGBO(123, 123, 123, 1);
  static const Color naturalGrey3 = Color.fromRGBO(88, 94, 103, 1);
  static const Color softGrey = Color.fromRGBO(240, 240, 240, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color disableBlack = Color.fromRGBO(24, 54, 78, 0.6);
  static const Color semanticInformation100 = Color.fromRGBO(255, 241, 229, 1);

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    final int alpha = color.alpha;

    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };

    return MaterialColor(color.value, shades);
  }
}
