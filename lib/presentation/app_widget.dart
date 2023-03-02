import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/theme_app.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edspert E-Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      initialRoute: RouterApp.diskusiSoalPage,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}
