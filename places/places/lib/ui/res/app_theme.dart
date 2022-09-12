import 'package:flutter/material.dart';

/// Строковые константы приложения

class AppTypography {
  static const textText16Regular = TextStyle(
    fontSize: 16.0,
    height: 1.25,
    fontWeight: FontWeight.w400,
  );

  static const textText32Bold = TextStyle(
      fontSize: 32.0,
      //color: Colors.black,
      fontFamily: "Roboto",
      fontWeight: FontWeight.bold,
      height: 1);

  static const textText14bold = TextStyle(
      fontSize: 14.0, fontFamily: 'Roboto', fontWeight: FontWeight.bold);
}

class AppColors {
  static const dmCardBackground = Color.fromRGBO(26, 26, 32, 1);
  static const lightGrey = Color.fromARGB(255, 245, 245, 245);
  static const dmText = Color.fromRGBO(255, 255, 255, 1);
  static const darkGrey = Color.fromRGBO(124, 126, 146, 0.56);
  static const darkButton = Color.fromRGBO(59, 62, 91, 1);
  static const darkIcon = Color.fromARGB(255, 58, 63, 91);
  static const dmBackground = Color.fromARGB(254, 33, 34, 44);
}

class AppSize {
  static const double appBarHeight = 72;
  static const double toolBarSize = 72;
}
