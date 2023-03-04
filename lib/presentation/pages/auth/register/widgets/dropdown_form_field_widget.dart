import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class DropdownFormFieldWidget extends StatelessWidget {
  final String nameField;
  final String hintText;
  final String value;
  final List<String> items;
  final Function(String?) onChanged;

  const DropdownFormFieldWidget({
    super.key,
    required this.value,
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
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
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
                          color: ColorsApp.titleActive, width: 1.0),
                    ),
            enabledBorder: Theme.of(context).inputDecorationTheme.border,
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          borderRadius: BorderApp.radius0,
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
