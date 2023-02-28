import 'package:flutter/material.dart';

class TextStyleApp {
  //Large text
  static TextStyle get largeTextDefault => const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 30,
        fontWeight: FontWeight.w700,
        height: 42,
        letterSpacing: 0,
      );
  static TextStyle get largeText30 => largeTextDefault;
  static TextStyle get largeText24 =>
      largeTextDefault.copyWith(fontSize: 24, height: 33.6);
  static TextStyle get largeText20 =>
      largeTextDefault.copyWith(fontSize: 20, height: 28);

  //Title
  static TextStyle get titleDefault => const TextStyle(
        fontFamily: 'SF Pro Display',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 28,
        letterSpacing: 0,
      );
  static TextStyle get titleDefault22 =>
      titleDefault.copyWith(fontSize: 22, height: 33);
  static TextStyle get titleDefault20 => titleDefault;
  static TextStyle get titleDefault18 =>
      titleDefault.copyWith(fontSize: 18, height: 25.2);
  static TextStyle get titleDefault16 =>
      titleDefault.copyWith(fontSize: 16, height: 22.4);
  static TextStyle get titleDefault14 =>
      titleDefault.copyWith(fontSize: 14, height: 19.6);
  static TextStyle get titleDefault13 =>
      titleDefault.copyWith(fontSize: 13, height: 18.2);
  static TextStyle get titleDefault10 =>
      titleDefault.copyWith(fontSize: 10, height: 14);
  static TextStyle get titleDefault8 =>
      titleDefault.copyWith(fontSize: 8, height: 11.2);

  //Subtitle
  static TextStyle get subtitleDefault => titleDefault.copyWith(
      fontSize: 16, fontWeight: FontWeight.w500, height: 22.4);
  static TextStyle get subtitle16 => subtitleDefault;
  static TextStyle get subtitle14 =>
      subtitleDefault.copyWith(fontSize: 14, height: 19.6);
  static TextStyle get subtitle12 =>
      subtitleDefault.copyWith(fontSize: 12, height: 16.8);
  static TextStyle get subtitle10 =>
      subtitleDefault.copyWith(fontSize: 10, height: 14);
  static TextStyle get subtitle8 =>
      subtitleDefault.copyWith(fontSize: 8, height: 11.2);
}
