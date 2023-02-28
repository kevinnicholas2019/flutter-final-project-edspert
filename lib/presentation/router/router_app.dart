import 'package:final_project_edspert/presentation/pages/auth/login/login_page.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/register_page.dart';
import 'package:final_project_edspert/presentation/pages/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static const String splashScreenPage = '/';
  static const String loginPage = '/login';
  static const String registerPage = '/register';

  static const navigator = Navigator();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case RouterApp.splashScreenPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashScreenPage(),
          settings: settings,
        );
      case RouterApp.loginPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case RouterApp.registerPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const RegisterPage(),
          settings: settings,
        );
      default:
        throw ErrorDescription("${settings.name} is not exists.");
    }
  }
}
