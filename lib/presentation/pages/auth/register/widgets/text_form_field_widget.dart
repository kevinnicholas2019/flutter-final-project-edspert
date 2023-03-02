import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String nameField;
  final String hintText;
  final TextInputType keyboardType;

  const FormFieldWidget({
    super.key,
    required this.nameField,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          nameField,
          style: TextStyleApp.largeTextDefault.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: keyboardType,
          style: TextStyleApp.largeTextDefault.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyleApp.largeTextDefault.copyWith(
              fontSize: 16,
              color: ColorsApp.placeholder,
              fontWeight: FontWeight.w500,
            ),
            focusedBorder:
                Theme.of(context).inputDecorationTheme.border!.copyWith(
                      borderSide: const BorderSide(
                        color: ColorsApp.titleActive,
                        width: 1.0,
                      ),
                    ),
            enabledBorder: Theme.of(context).inputDecorationTheme.border,
          ),
        ),
      ],
    );
  }
}
