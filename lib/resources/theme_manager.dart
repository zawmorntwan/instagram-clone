import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.mobileBackgroundColor,
    primaryColor: ColorManager.primaryColor,
  );
}