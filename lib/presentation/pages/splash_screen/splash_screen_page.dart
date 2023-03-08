import 'package:final_project_edspert/application/auth/splash_page/splash_bloc.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Color _color = ColorsApp.primary;
  final SplashBloc _bloc = SplashBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(SplashEventOnLoad());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: BlocListener<SplashBloc, SplashState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is! SplashInitial) {
            setState(() {
              _color = ColorsApp.backgroundPage;
            });
            Future.delayed(const Duration(seconds: 1), () {
              switch (state.runtimeType) {
                case SplashAuthenticate:
                  Navigator.pushReplacementNamed(context, RouterApp.homePage);
                  break;
                case SplashAuthenticateNoRegister:
                  final thisState = (state as SplashAuthenticateNoRegister);
                  Navigator.pushReplacementNamed(
                      context, RouterApp.registerPage,
                      arguments: {
                        "email": thisState.userCredential.email,
                        "displayName": thisState.userCredential.displayName,
                      });
                  break;
                case SplashUnauthenticate:
                  Navigator.pushReplacementNamed(context, RouterApp.loginPage);
                  break;
              }
            });
          }
        },
        child: AnimatedContainer(
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
      ),
    );
  }
}
