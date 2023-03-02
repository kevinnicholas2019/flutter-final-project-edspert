import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorsApp {
  //Colors
  static const Color primary = Color(0xFF3A7FD5);
  static const Color secondary = Color(0xFF27B1E0);
  static const Color error = Color(0xFFED2E2E);
  static const Color success = Color(0xFF00BA4A);
  static const Color warning = Color(0xFFFFCC47);
  //Gradients
  static const GradientRotation _gradientRotation =
      GradientRotation(math.pi / 4);
  static const LinearGradient gradientPrimary = LinearGradient(
    colors: [Color(0xFF00908F), Color(0xFF05C9C4)],
    stops: [0.0, 1.0],
    transform: _gradientRotation,
  );
  static const LinearGradient gradientSecondary = LinearGradient(
    colors: [Color(0xFF05C9C4), Color(0xFF83EE9D)],
    stops: [0.0, 1.0],
    transform: _gradientRotation,
  );
  static const LinearGradient gradientAccent = LinearGradient(
    colors: [Color(0xFFFF4F03), Color(0xFFFF8707)],
    stops: [0.0, 1.0],
    transform: _gradientRotation,
  );
  //Grayscale
  static const Color titleActive = Color(0xFF14142B);
  static const Color body = Color(0xFF4E4B66);
  static const Color label = Color(0xFF85868B);
  static const Color placeholder = Color(0xFFBFC0C2);
  static const Color line = Color(0xFFE4E4E5);
  static const Color inputBackground = Color(0xFFF6F6F6);
  static const Color background = Color(0xFFF9F9F9);
  static const Color backgroundPage = Color(0xFFF0F3F5);
  static const Color offWhite = Color(0xFFFCFCFC);
}
