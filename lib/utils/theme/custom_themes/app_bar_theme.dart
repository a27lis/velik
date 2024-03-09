import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velik/utils/constants/colors.dart';


class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: TColors.background, // Цвет статусной строки
      statusBarIconBrightness: Brightness.dark,
      )  

  );
}