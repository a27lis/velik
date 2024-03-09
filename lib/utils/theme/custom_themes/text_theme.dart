import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      bodyMedium: const TextStyle().copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: HexColor("2A344D"))
  );
}