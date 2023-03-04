import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class SignInGoogleWidget extends StatelessWidget {
  const SignInGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderApp.radius3,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 26.42,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: ColorsApp.secondary,
              ),
              borderRadius: BorderApp.radius3,
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
          backgroundColor: const MaterialStatePropertyAll(ColorsApp.background),
          foregroundColor: MaterialStateColor.resolveWith(
            (states) {
              const Set<MaterialState> interactiveStates = <MaterialState>{
                MaterialState.pressed,
              };
              if (states.any(interactiveStates.contains)) {
                return ColorsApp.offWhite;
              }
              return ColorsApp.titleActive;
            },
          ),
          textStyle: MaterialStatePropertyAll(
            TextStyleApp.titleDefault18.copyWith(
              fontSize: 17,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/google.png",
              width: 34,
              height: 34,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 8),
            const Flexible(
              child: Text(
                'Masuk dengan Google',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
