import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorsApp {
  //Colors
  static Color get primary => const Color(0xFF357AD4);
  static Color get secondary => const Color(0xFF27B1E0);
  static Color get error => const Color(0xFFED2E2E);
  static Color get success => const Color(0xFF00BA4A);
  static Color get warning => const Color(0xFFFFCC47);
  //Gradients
  static const GradientRotation _gradientRotation =
      GradientRotation(math.pi / 4);
  static LinearGradient get gradientPrimary => const LinearGradient(
        colors: [Color(0xFF00908F), Color(0xFF05C9C4)],
        stops: [0.0, 1.0],
        transform: _gradientRotation,
      );
  static LinearGradient get gradientSecondary => const LinearGradient(
        colors: [Color(0xFF05C9C4), Color(0xFF83EE9D)],
        stops: [0.0, 1.0],
        transform: _gradientRotation,
      );
  static LinearGradient get gradientAccent => const LinearGradient(
        colors: [Color(0xFFFF4F03), Color(0xFFFF8707)],
        stops: [0.0, 1.0],
        transform: _gradientRotation,
      );
  //Grayscale
  static Color get titleActive => const Color(0xFF14142B);
  static Color get body => const Color(0xFF4E4B66);
  static Color get label => const Color(0xFF85868B);
  static Color get placeholder => const Color(0xFFBFC0C2);
  static Color get line => const Color(0xFFE4E4E5);
  static Color get inputBackground => const Color(0xFFF6F6F6);
  static Color get background => const Color(0xFFF9F9F9);
  static Color get backgroundPage => const Color(0xFFF0F3F5);
  static Color get offWhite => const Color(0xFFFCFCFC);
}
