import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../resources/color_manager.dart';

enum LoaderShape {
  fadingCircle,
  threeBounce,
}

// ignore: must_be_immutable
class Loader extends StatelessWidget {
  Loader({
    Key? key,
    this.size = 20,
    this.shape,
    this.color,
  }) : super(key: key);

  Color? color;
  LoaderShape? shape;
  double size;

  @override
  Widget build(BuildContext context) {
    switch (shape) {
      case LoaderShape.fadingCircle:
        return SpinKitFadingCircle(
          color: color ?? ColorManager.greyColor,
          size: size,
        );
      case LoaderShape.threeBounce:
        return SpinKitThreeBounce(
          color: color ?? ColorManager.greyColor,
          size: size,
        );
      default:
        return SpinKitCircle(
          color: color ?? ColorManager.greyColor,
          size: size,
        );
    }
  }
}
