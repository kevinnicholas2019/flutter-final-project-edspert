import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleApp {
  const TextStyleApp._();
  //Large text
  static TextStyle get largeTextDefault => GoogleFonts.poppins().copyWith(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: ColorsApp.titleActive,
      );
  static TextStyle get largeText30 => largeTextDefault;
  static TextStyle get largeText24 => largeTextDefault.copyWith(fontSize: 24);
  static TextStyle get largeText20 => largeTextDefault.copyWith(fontSize: 20);

  //Title
  static TextStyle get titleDefault => GoogleFonts.sourceSansPro().copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        color: ColorsApp.titleActive,
      );
  static TextStyle get titleDefault22 => titleDefault.copyWith(fontSize: 22);
  static TextStyle get titleDefault20 => titleDefault;
  static TextStyle get titleDefault18 => titleDefault.copyWith(fontSize: 18);
  static TextStyle get titleDefault16 => titleDefault.copyWith(fontSize: 16);
  static TextStyle get titleDefault14 => titleDefault.copyWith(fontSize: 14);
  static TextStyle get titleDefault13 => titleDefault.copyWith(fontSize: 13);
  static TextStyle get titleDefault10 => titleDefault.copyWith(fontSize: 10);
  static TextStyle get titleDefault8 => titleDefault.copyWith(fontSize: 8);

  //Subtitle
  static TextStyle get subtitleDefault => titleDefault.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsApp.titleDisable,
      );
  static TextStyle get subtitle16 => subtitleDefault;
  static TextStyle get subtitle14 => subtitleDefault.copyWith(fontSize: 14);
  static TextStyle get subtitle12 => subtitleDefault.copyWith(fontSize: 12);
  static TextStyle get subtitle10 => subtitleDefault.copyWith(fontSize: 10);
  static TextStyle get subtitle8 => subtitleDefault.copyWith(fontSize: 8);
}
