import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
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
            children: [
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 26.42,
                    ),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: ColorsApp.secondary,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  overlayColor: MaterialStateColor.resolveWith(
                    (states) {
                      const Set<MaterialState> interactiveStates =
                          <MaterialState>{
                        MaterialState.pressed,
                      };
                      if (states.any(interactiveStates.contains)) {
                        return ColorsApp.secondary.withOpacity(0.375);
                      }
                      return ColorsApp.secondary.withOpacity(0.25);
                    },
                  ),
                  iconColor: MaterialStateColor.resolveWith(
                    (states) {
                      return Colors.black.withOpacity(0.5);
                    },
                  ),
                  foregroundColor: MaterialStateColor.resolveWith(
                    (states) {
                      const Set<MaterialState> interactiveStates =
                          <MaterialState>{
                        MaterialState.pressed,
                      };
                      if (states.any(interactiveStates.contains)) {
                        return ColorsApp.offWhite;
                      }
                      return ColorsApp.titleActive;
                    },
                  ),
                  textStyle: MaterialStatePropertyAll(
                    TextStyleApp.titleDefault18.copyWith(
                      fontSize: 17,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/google.png",
                      width: 34,
                      height: 34,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 8),
                    const Flexible(
                      child: Text(
                        'Masuk dengan Google',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 26.42,
                    ),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: ColorsApp.titleActive,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  iconColor: MaterialStateColor.resolveWith((states) {
                    const Set<MaterialState> interactiveStates =
                        <MaterialState>{
                      MaterialState.pressed,
                    };
                    if (states.any(interactiveStates.contains)) {
                      return ColorsApp.titleActive;
                    }
                    return ColorsApp.offWhite;
                  }),
                  foregroundColor: MaterialStateColor.resolveWith((states) {
                    const Set<MaterialState> interactiveStates =
                        <MaterialState>{
                      MaterialState.pressed,
                    };
                    if (states.any(interactiveStates.contains)) {
                      return ColorsApp.titleActive;
                    }
                    return ColorsApp.offWhite;
                  }),
                  textStyle: MaterialStatePropertyAll(
                    TextStyleApp.titleDefault18.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    ColorsApp.titleActive,
                  ),
                  overlayColor: MaterialStateColor.resolveWith((states) {
                    const Set<MaterialState> interactiveStates =
                        <MaterialState>{
                      MaterialState.pressed,
                    };
                    if (states.any(interactiveStates.contains)) {
                      return ColorsApp.offWhite;
                    }
                    return ColorsApp.titleActive;
                  }),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.apple,
                      size: 34,
                    ),
                    SizedBox(width: 8),
                    Flexible(child: Text('Masuk dengan Apple ID')),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
