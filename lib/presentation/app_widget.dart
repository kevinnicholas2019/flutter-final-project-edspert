import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edspert E-Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: ColorsApp.primary,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              color: ColorsApp.primary,
              iconTheme: ThemeData.dark().iconTheme,
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorsApp.primary,
          foregroundColor: ColorsApp.offWhite,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsApp.offWhite,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: ColorsApp.line, width: 1.0),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ColorsApp.secondary,
        ),
      ),
      initialRoute: RouterApp.registerPage,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}
