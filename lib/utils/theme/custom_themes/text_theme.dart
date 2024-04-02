import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velik/utils/constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      bodyMedium: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.w100, color: TColors.textColor, fontFamily: "m_plus")
  );
}