import 'package:farm_app/src/utils/color_app.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  TextTheme _textTheme(TextTheme base) {
    return base.copyWith(
        headline: base.headline.copyWith(
            fontFamily: 'Monserrat',
            fontSize: 22.0,
            color: Colors.black
        )
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _textTheme(base.textTheme),
    primaryColor: ColorApp.primaryColor,
    accentColor: ColorApp.accentColor,
  );
}