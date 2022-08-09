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

class AppSize {
  static const double appBarHeight = 72;
  static const double toolBarSize = 72;
}

class AppImage {
  static const heart_img_dark = Image(
      image: AssetImage('lib/ui/res/icons/heart_icon.png'),
      color: Color.fromRGBO(124, 126, 146, 0.56));

  static const heart_img_light = Image(
      image: AssetImage('lib/ui/res/icons/heart_icon.png'),
      color: Color.fromRGBO(124, 126, 146, 0.56));
  static const calendar_dark = Image(
      image: AssetImage('lib/ui/res/icons/calendar.png'),
      color: Color.fromARGB(255, 58, 63, 91));

  static const back_light =
      Image(image: AssetImage('lib/ui/res/icons/ARROW.png'));

  static const way_light = Image(image: AssetImage('lib/ui/res/icons/way.png'));
}
