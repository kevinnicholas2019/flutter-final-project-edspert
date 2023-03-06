import 'dart:ui';

import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/theme_app.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: _MyCustomScrollBehavior(),
      title: 'Edspert E-Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      initialRoute: RouterApp.homePage,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}

class _MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
