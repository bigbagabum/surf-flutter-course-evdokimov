import 'package:flutter/material.dart';

/// Строковые константы приложения
class AppStrings {
  static const appTitle = "Список\nинтересных мест";
}

class AppAssets {
  static const favorite = 'res/icons/heart_icon.svg';
}

class AppTypography {
  static const textText16Regular = TextStyle(
    fontSize: 16.0,
    height: 1.25,
    fontWeight: FontWeight.w400,
  );

  static const textText32Bold = TextStyle(
      fontSize: 32.0,
      color: Colors.black,
      fontFamily: "Roboto",
      fontWeight: FontWeight.bold,
      height: 1);
}

class AppColors {
  static const myColor = Colors.red;
}
