import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Color _color = ColorsApp.primary;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => setState(() {
        _color = ColorsApp.backgroundPage;
      }),
    );
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => Navigator.popAndPushNamed(context, RouterApp.loginPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: AnimatedContainer(
        color: _color,
        duration: const Duration(seconds: 1),
        child: const SafeArea(
          child: Center(
            child: Image(
              image: AssetImage('assets/splash_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
