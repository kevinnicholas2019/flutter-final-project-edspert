import 'package:final_project_edspert/application/exercises/exercise_bloc.dart';
import 'package:final_project_edspert/presentation/pages/mapel/paket_soal/widgets/paket_soal_button.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

class PilihPaketSoalPage extends StatelessWidget {
  final String courseId;
  final String namaPelajaran;

  const PilihPaketSoalPage({
    super.key,
    required this.namaPelajaran,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExerciseBloc>(context).add(OnGetExercises(courseId));

    return Scaffold(
      appBar: AppBarDefault.make(
        title: namaPelajaran,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: BlocBuilder<ExerciseBloc, ExerciseState>(
            builder: (context, state) {
              if (state is ExerciseOnSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Pilih Paket Soal',
                        style: TextStyleApp.largeTextDefault.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: state.exercises.isNotEmpty
                          ? GridView.count(
                              childAspectRatio: math.max(
                                (153 - 12 * 2) / (96 + 12 * 2),
                                1.0,
                              ),
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              crossAxisCount: math.max(
                                  (MediaQuery.of(context).size.width ~/
                                          (153 - 12 * 2))
                                      .toInt(),
                                  1),
                              crossAxisSpacing: 14.0,
                              mainAxisSpacing: 12.0,
                              children: [
                                for (var exercise in state.exercises)
                                  PaketSoalButton(
                                    namaPaketSoal: exercise.exerciseTitle.value,
                                    totalSoal: exercise.jumlahSoal.value,
                                    icon: exercise.icon.value,
                                  ),
                              ],
                            )
                          : ListView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              children: [
                                SizedBox(
                                  height: math.max(
                                    MediaQuery.of(context).size.height -
                                        80 -
                                        30,
                                    320,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Image.asset(
                                        "assets/illustrations/not_found.png",
                                        height: 150,
                                      ),
                                      const SizedBox(height: 60),
                                      Text(
                                        'Yah, Paket tidak tersedia',
                                        style: TextStyleApp.largeTextDefault
                                            .copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Tenang, masih banyak yang bisa kamu pelajari. cari lagi yuk!',
                                        style: TextStyleApp.subtitle12
                                            .copyWith(fontSize: 13),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                );
              } else if (state is ExerciseOnFail) {}

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
