import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class KerjakanSoalPage extends StatelessWidget {
  final String namaPelajaran;
  final String namaPaketSoal;

  const KerjakanSoalPage({
    super.key,
    required this.namaPelajaran,
    required this.namaPaketSoal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.make(
        title: 'Latihan Soal',
      ),
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 46,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 1; i <= 20; i++) ...[
                      SizedBox(
                        width: 23,
                        height: 23,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.zero,
                            ),
                            shape: const MaterialStatePropertyAll(
                              CircleBorder(
                                side: BorderSide(
                                  color: ColorsApp.secondary,
                                ),
                              ),
                            ),
                            textStyle: MaterialStatePropertyAll(
                              TextStyleApp.largeTextDefault.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          child: Text(i.toString()),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ]
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  children: const [
                    Text('Soal Nomor 1'),
                    SizedBox(height: 7),
                    Text(
                      "      Yogyakarta is one of the foremost cultural centers of Java, the seat of the mighty Javanese empire of Mataram from which present day Yogyakarta has the best inherited of traditions. The city itself has a special charm, which seldom fails to captivate the visitor. Gamelan, classical and contemporary Javanese dances, leather puppet, theater and other expressions of traditional art will keep the visitor spellbound. Local craftsmen excel in arts such batiks, silver and leather works. Next to the traditional, contemporary art has found fertile soil in Yogya's culture oriented society.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
