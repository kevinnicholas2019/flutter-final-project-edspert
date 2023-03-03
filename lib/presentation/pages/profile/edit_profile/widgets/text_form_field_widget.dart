import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class EditFormFieldWidget extends StatelessWidget {
  final String nameField;
  final String hintText;
  final String initValue;
  final TextInputType keyboardType;

  const EditFormFieldWidget({
    super.key,
    required this.nameField,
    required this.hintText,
    required this.initValue,
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
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorsApp.titleDisable,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          initialValue: initValue,
          keyboardType: keyboardType,
          style: TextStyleApp.largeTextDefault.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            fillColor: ColorsApp.backgroundPage,
            hintText: hintText,
            hintStyle: TextStyleApp.largeTextDefault.copyWith(
              fontSize: 16,
              color: ColorsApp.placeholder,
              fontWeight: FontWeight.w500,
            ),
            border: const UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
