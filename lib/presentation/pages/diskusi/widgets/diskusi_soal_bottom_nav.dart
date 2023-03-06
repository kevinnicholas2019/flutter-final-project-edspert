import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class DiskusiSoalBottomNav extends StatelessWidget {
  const DiskusiSoalBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 54, maxHeight: 54 * 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: ColorsApp.offWhite,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                fixedSize: MaterialStatePropertyAll(Size.fromWidth(32)),
                iconSize: MaterialStatePropertyAll(32),
                iconColor: MaterialStatePropertyAll(ColorsApp.primary),
              ),
              child: const Icon(Icons.add),
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: TextFormField(
              minLines: null,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: TextStyleApp.titleDefault13.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                suffixIcon: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    fixedSize: MaterialStatePropertyAll(Size.fromWidth(32)),
                    iconSize: MaterialStatePropertyAll(32),
                    iconColor: MaterialStatePropertyAll(ColorsApp.primary),
                  ),
                  child: const Icon(Icons.camera_alt_rounded),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                hintText: 'Ketuk untuk menulis....',
                hintStyle: TextStyleApp.titleDefault13.copyWith(
                  fontSize: 16,
                  color: ColorsApp.placeholder,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder:
                    Theme.of(context).inputDecorationTheme.border!.copyWith(
                          borderSide: const BorderSide(
                            color: ColorsApp.titleActive,
                            width: 0.2,
                          ),
                        ),
                enabledBorder: Theme.of(context).inputDecorationTheme.border,
              ),
            ),
          ),
          const SizedBox(
            width: 26,
          ),
          SizedBox(
            width: 32,
            height: 32,
            child: TextButton(
              onPressed: () {},
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                fixedSize: MaterialStatePropertyAll(Size.fromWidth(32)),
                iconSize: MaterialStatePropertyAll(32),
                iconColor: MaterialStatePropertyAll(ColorsApp.primary),
              ),
              child: const Icon(Icons.send_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
