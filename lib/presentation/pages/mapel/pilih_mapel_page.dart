import 'package:final_project_edspert/application/courses/course_bloc.dart';
import 'package:final_project_edspert/presentation/pages/mapel/widgets/mapel_button.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

class PilihMapelPage extends StatelessWidget {
  const PilihMapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CourseBloc>(context).add(OnGetCourses());

    return Scaffold(
      appBar: AppBarDefault.make(
        title: 'Pilih Pelajaran',
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseOnSuccess) {
                return GridView.count(
                  childAspectRatio: math.max(316 / 96, 1.0),
                  crossAxisCount: math.max(
                      (MediaQuery.of(context).size.width ~/ 316).toInt(), 1),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  padding: const EdgeInsets.all(20),
                  children: [
                    for (var course in state.courses)
                      MapelButton(
                        namaMapel: course.courseName.value,
                        totalPaketLatihanSoal: course.jumlahMateri.value,
                        imageUrl: course.urlCover.value,
                      ),
                  ],
                );
              } else if (state is CourseOnFail) {}

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
