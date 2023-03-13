import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlStyleApp {
  const HtmlStyleApp._();

  static final soalStyle = {
    "body": Style(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
    ),
    "p": Style(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      textAlign: TextAlign.justify,
      fontSize: const FontSize(13),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
  };

  static final jawabanStyle = {
    "body": Style(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
    ),
    "p": Style(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(top: 2.525),
      fontSize: const FontSize(13),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: ColorsApp.titleActive,
    ),
  };

  static final jawabanChoosedStyle = {
    "body": Style(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
    ),
    "p": Style(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(top: 2.525),
      fontSize: const FontSize(13),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: ColorsApp.offWhite,
    ),
  };
}
