import 'package:final_project_edspert/application/auth/login_page/login_page_bloc.dart';
import 'package:final_project_edspert/presentation/pages/auth/login/widgets/sign_in_apple_widget.dart';
import 'package:final_project_edspert/presentation/pages/auth/login/widgets/sign_in_google_widget.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = LoginPageBloc();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: ListView(
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
              SizedBox(
                height: math.max(MediaQuery.of(context).size.height - 525, 100),
              ),
              BlocConsumer<LoginPageBloc, LoginPageState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is SignInError) {
                    print(state.errorMsg);
                  } else if (state is SignInSuccess) {
                    Navigator.pushNamed(
                      context,
                      RouterApp.registerPage,
                      arguments: {
                        "displayName": state.displayName,
                        "email": state.email,
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: state is SignInWithGoogleState ||
                            state is SignInWithAppleState
                        ? [
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(),
                            ),
                          ]
                        : [
                            SignInGoogleWidget(bloc: bloc),
                            // SizedBox(
                            //   height: 25,
                            // ),
                            // SignInAppleWidget(),
                          ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
