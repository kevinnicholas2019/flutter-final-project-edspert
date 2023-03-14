import 'package:final_project_edspert/application/courses/course_bloc.dart';
import 'package:final_project_edspert/presentation/pages/mapel/widgets/mapel_button.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PilihMapelPage extends StatelessWidget {
  const PilihMapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final majors = ['IPA', 'IPS'];
    BlocProvider.of<CourseBloc>(context).add(OnGetCourses());

    return Scaffold(
      appBar: AppBarDefault.make(
        title: 'Pilih Pelajaran',
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: RefreshIndicator(
            onRefresh: () async =>
                BlocProvider.of<CourseBloc>(context).add(OnGetCourses()),
            child: BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if (state is CourseOnSuccess) {
                  return ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      for (var major in majors) ...[
                        Text(
                          major,
                          style: TextStyleApp.largeTextDefault.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childAspectRatio: math.max(316 / 96, 1.0),
                          crossAxisCount: math.max(
                              (MediaQuery.of(context).size.width ~/ 316)
                                  .toInt(),
                              1),
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: [
                            for (var course in state.courses.where(
                                (element) => element.majorName.value == major))
                              MapelButton(
                                courseId: course.id.value,
                                namaMapel: course.courseName.value,
                                totalPaketLatihanSoal:
                                    course.jumlahMateri.value,
                                imageUrl: course.urlCover.value,
                              ),
                          ],
                        ),
                        if (major != majors.last)
                          const SizedBox(
                            height: 12,
                          ),
                      ],
                    ],
                  );
                } else if (state is CourseOnFail) {
                  EasyLoading.showError(state.failedMsg);
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
