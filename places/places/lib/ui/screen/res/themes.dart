import 'package:flutter/material.dart';
import 'package:places/ui/res/app_theme.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.dmBackground,
    //backgroundColor: AppColors.dmBackground,
    //primaryColor: AppColors.dmBackground,
    //primaryColorDark: Colors.black,
    primaryColorDark: AppColors.dmCardBackground, //фон карточек и инпутов
    primaryColorLight: AppColors.dmPrimaryLightColor,
    secondaryHeaderColor: AppColors.darkGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.dmBackground,
    ));

final lightTheme = ThemeData(
    primaryColorDark: AppColors.lightGrey,
    primaryColorLight: AppColors.darkGrey);
