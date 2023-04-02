import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import 'style_manager.dart';

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.mobileBackgroundColor,
    primaryColor: ColorManager.primaryColor,

    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.mobileBackgroundColor,
    ),

    // Text Field Theme
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: getRegularTextStyle(
        color: ColorManager.secondaryColor,
      ),
    ),
  );
}
