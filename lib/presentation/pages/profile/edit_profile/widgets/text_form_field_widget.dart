import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class EditFormFieldWidget extends StatelessWidget {
  final String nameField;
  final String hintText;
  final String initValue;
  final TextInputType keyboardType;
  final bool? enabled;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  const EditFormFieldWidget({
    super.key,
    required this.nameField,
    required this.hintText,
    required this.initValue,
    this.enabled,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
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
          enabled: enabled ?? true,
          onChanged: onChanged,
          validator: validator,
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
