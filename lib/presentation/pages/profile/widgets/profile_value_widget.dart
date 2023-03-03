import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class ProfileValueWidget extends StatelessWidget {
  final String label;
  final String value;

  const ProfileValueWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyleApp.largeTextDefault.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: ColorsApp.titleActive.withOpacity(0.4),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: TextStyleApp.largeTextDefault.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
