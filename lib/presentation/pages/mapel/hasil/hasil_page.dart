import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';

class HasilPage extends StatefulWidget {
  const HasilPage({super.key});

  @override
  State<HasilPage> createState() => _HasilPageState();
}

class _HasilPageState extends State<HasilPage>
    with SingleTickerProviderStateMixin {
  final int nilai = 100;
  late AnimationController _nilaiController;

  LinearGradient _gradientBody = ColorsApp.gradientDisabled;
  double _opacityPiala = 0.0;
  double _scaleText = 0.0;

  @override
  void initState() {
    super.initState();
    _nilaiController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => setState(
        () {
          _gradientBody = ColorsApp.gradientPrimary;
          _opacityPiala = 1.0;
          _scaleText = 1.0;
          _nilaiController.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    _nilaiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: ColorsApp.primary,
        child: SafeArea(
          child: AnimatedContainer(
            decoration: BoxDecoration(
              gradient: _gradientBody,
            ),
            duration: const Duration(seconds: 1),
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: ButtonStyle(
                        foregroundColor:
                            const MaterialStatePropertyAll(ColorsApp.offWhite),
                        iconSize: const MaterialStatePropertyAll(24),
                        textStyle: MaterialStatePropertyAll(
                          TextStyleApp.largeTextDefault.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        overlayColor: MaterialStatePropertyAll(
                          ColorsApp.offWhite.withOpacity(0.5),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.close_rounded),
                          SizedBox(
                            width: 12,
                          ),
                          Text('Tutup'),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
                const SizedBox(height: 67),
                Text(
                  'Selamat',
                  style: TextStyleApp.largeText24.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorsApp.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  'Kamu telah menyelesaikan Kuiz ini',
                  style: TextStyleApp.largeTextDefault.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: ColorsApp.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: _opacityPiala,
                  child: Image.asset(
                    'assets/illustrations/piala.png',
                    width: 180,
                    height: 180,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'Nilai kamu:',
                  style: TextStyleApp.largeTextDefault.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: ColorsApp.offWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                AnimatedScale(
                  duration: const Duration(seconds: 1),
                  scale: _scaleText,
                  child: AnimatedBuilder(
                    animation: _nilaiController,
                    builder: (_, __) => Text(
                      '${(nilai * _nilaiController.value).toInt()}',
                      style: TextStyleApp.largeTextDefault.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 96,
                        color: ColorsApp.offWhite,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
