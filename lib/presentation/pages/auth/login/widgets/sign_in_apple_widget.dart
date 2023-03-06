import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class SignInAppleWidget extends StatelessWidget {
  const SignInAppleWidget({super.key});

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
                color: ColorsApp.titleActive,
              ),
              borderRadius: BorderApp.radius3,
            ),
          ),
          iconColor: MaterialStateColor.resolveWith((states) {
            const Set<MaterialState> interactiveStates = <MaterialState>{
              MaterialState.pressed,
              MaterialState.hovered,
            };
            if (states.any(interactiveStates.contains)) {
              return ColorsApp.titleActive;
            }
            return ColorsApp.background;
          }),
          foregroundColor: MaterialStateColor.resolveWith((states) {
            const Set<MaterialState> interactiveStates = <MaterialState>{
              MaterialState.pressed,
              MaterialState.hovered,
            };
            if (states.any(interactiveStates.contains)) {
              return ColorsApp.titleActive;
            }
            return ColorsApp.background;
          }),
          textStyle: MaterialStatePropertyAll(
            TextStyleApp.titleDefault18.copyWith(
              fontSize: 17,
            ),
          ),
          overlayColor: MaterialStateColor.resolveWith((states) {
            const Set<MaterialState> interactiveStates = <MaterialState>{
              MaterialState.pressed,
            };
            if (states.any(interactiveStates.contains)) {
              return ColorsApp.background;
            }
            return ColorsApp.background.withOpacity(0.85);
          }),
          backgroundColor: const MaterialStatePropertyAll(
            ColorsApp.titleActive,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.apple,
              size: 34,
            ),
            SizedBox(width: 8),
            Flexible(child: Text('Masuk dengan Apple ID')),
          ],
        ),
      ),
    );
  }
}
