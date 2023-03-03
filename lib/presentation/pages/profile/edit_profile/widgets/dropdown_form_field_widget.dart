import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class EditDropdownFormFieldWidget extends StatelessWidget {
  final String nameField;
  final String hintText;
  final String initValue;
  final List<String> items;
  final Function(String?) onChanged;

  const EditDropdownFormFieldWidget({
    super.key,
    required this.initValue,
    required this.items,
    required this.nameField,
    required this.hintText,
    required this.onChanged,
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
        DropdownButtonFormField(
          value: initValue,
          style: TextStyleApp.largeTextDefault.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyleApp.largeTextDefault.copyWith(
              fontSize: 16,
              color: ColorsApp.placeholder,
              fontWeight: FontWeight.w500,
            ),
            border: const UnderlineInputBorder(),
            fillColor: ColorsApp.backgroundPage,
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          borderRadius: BorderApp.radius,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
