
import 'package:flutter/material.dart';

abstract class UnsafeColorWidget extends StatelessWidget {
  final Color unsafeColor;
  const UnsafeColorWidget({super.key, required this.unsafeColor});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
