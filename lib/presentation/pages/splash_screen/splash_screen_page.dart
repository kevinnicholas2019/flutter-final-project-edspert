import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: const Center(
            child: Image(
              image: AssetImage('assets/splash_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
