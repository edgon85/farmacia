import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';

class GradientDecoration {
  // gradiente en el appbar
  BoxDecoration gradientDecoraion() {
    return BoxDecoration(gradient: myLinearGradient());
  }

  myLinearGradient() {
    return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [ColorApp.primaryColor, ColorApp.accentColor]);
  }
}
