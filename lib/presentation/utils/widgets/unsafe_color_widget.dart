import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';

abstract class UnsafeColorWidget extends StatelessWidget {
  final Color unsafeColor;
  const UnsafeColorWidget({super.key, required this.unsafeColor});
}

class UnsafeColorWidgetLoading extends UnsafeColorWidget {
  const UnsafeColorWidgetLoading({
    super.key,
    super.unsafeColor = ColorsApp.backgroundPage,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
