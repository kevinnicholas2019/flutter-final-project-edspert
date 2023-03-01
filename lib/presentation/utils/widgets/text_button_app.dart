import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class TextButtonApp {
  static Widget textButtonCustom1(String text, {Function()? onPressed}) =>
      TextButton(
        onPressed: onPressed ?? () {},
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 26.42,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: ColorsApp.secondary,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          overlayColor: MaterialStateColor.resolveWith(
            (states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
              };
              if (states.any(interactiveStates.contains)) {
                return ColorsApp.secondary.withOpacity(0.375);
              }
              return ColorsApp.secondary.withOpacity(0.25);
            },
          ),
          iconColor: MaterialStateColor.resolveWith(
            (states) {
              return Colors.black.withOpacity(0.5);
            },
          ),
          backgroundColor: MaterialStatePropertyAll(ColorsApp.primary),
          foregroundColor: MaterialStateColor.resolveWith(
            (states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
              };
              if (states.any(interactiveStates.contains)) {
                return ColorsApp.offWhite.withOpacity(0.75);
              }
              return ColorsApp.offWhite;
            },
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyleApp.largeTextDefault.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        child: Text(text),
      );
}
