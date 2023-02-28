import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Expanded(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: const Center(
              child: Image(
                image: AssetImage('assets/splash_logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
