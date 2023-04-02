import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';
import '../screens/add_post_screen.dart';

const webScreenSize = 600;

final homeScreenItems = [
  Text(
    'Feed',
    style: getRegularTextStyle(
      color: ColorManager.primaryColor,
    ),
  ),
  Text(
    'Search',
    style: getRegularTextStyle(
      color: ColorManager.primaryColor,
    ),
  ),
  const AddPostScreen(),
  Text(
    'Noti',
    style: getRegularTextStyle(
      color: ColorManager.primaryColor,
    ),
  ),
  Text(
    'Profile',
    style: getRegularTextStyle(
      color: ColorManager.primaryColor,
    ),
  ),
];
