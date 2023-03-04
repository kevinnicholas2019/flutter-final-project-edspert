import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeApp {
  static final ThemeData light = ThemeData.light().copyWith(
    primaryColor: ColorsApp.primary,
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          color: ColorsApp.primary,
          iconTheme: ThemeData.dark().iconTheme,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsApp.primary,
      foregroundColor: ColorsApp.offWhite,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsApp.offWhite,
      border: OutlineInputBorder(
        borderRadius: BorderApp.radius0,
        borderSide: const BorderSide(color: ColorsApp.line, width: 1.0),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorsApp.secondary,
    ),
  );
}
