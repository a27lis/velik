import 'package:flutter/material.dart';
import 'package:velik/utils/constants/colors.dart';
import 'package:velik/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:velik/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    useMaterial3: true,
    primaryColor: TColors.accent,
    scaffoldBackgroundColor: TColors.background,
    textTheme: TTextTheme.lightTextTheme,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
  );
}
