import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class AppBarDefault {
  static final TextStyle _defaultTitleTextStyle =
      TextStyleApp.largeTextDefault.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: ColorsApp.offWhite,
  );

  const AppBarDefault._();

  static PreferredSizeWidget make({
    required String title,
    TextStyle? titleTextStyle,
    bool centerTitle = true,
  }) =>
      PreferredSize(
        preferredSize: const Size.fromHeight(55.26),
        child: AppBar(
          elevation: 0,
          titleTextStyle: titleTextStyle ?? _defaultTitleTextStyle,
          title: Text(title),
          centerTitle: centerTitle,
        ),
      );
}
