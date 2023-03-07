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
    Future.delayed(
      const Duration(seconds: 1),
      () => setState(() {
        _color = ColorsApp.backgroundPage;
      }),
    );
    Future.delayed(
      const Duration(milliseconds: 2000),
      () async {
        _bloc.add(SplashEventOnLoad());
      },
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: BlocListener<SplashBloc, SplashState>(
        bloc: _bloc,
        listener: (context, state) {
          switch (state.runtimeType) {
            case SplashAuthenticate:
              Navigator.pushReplacementNamed(context, RouterApp.homePage);
              break;
            case SplashUnauthenticate:
              Navigator.pushReplacementNamed(context, RouterApp.loginPage);
              break;
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
