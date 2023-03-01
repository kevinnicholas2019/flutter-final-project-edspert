import 'package:final_project_edspert/presentation/pages/auth/login/widgets/sign_in_apple_widget.dart';
import 'package:final_project_edspert/presentation/pages/auth/login/widgets/sign_in_google_widget.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        children: [
          Text(
            'Login',
            style: TextStyleApp.largeText20,
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Image(
              image: AssetImage('assets/illustrations/login_page.png'),
            ),
          ),
          const SizedBox(
            height: 56,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Selamat Datang',
                style: TextStyleApp.titleDefault22,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 3.5,
              ),
              Text(
                'Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal',
                style: TextStyleApp.subtitle14,
                textAlign: TextAlign.center,
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SignInGoogleWidget(),
              SizedBox(
                height: 25,
              ),
              SignInAppleWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
