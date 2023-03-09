import 'dart:ui';

import 'package:final_project_edspert/application/banners/banner_bloc.dart';
import 'package:final_project_edspert/application/courses/course_bloc.dart';
import 'package:final_project_edspert/application/exercises/exercise_bloc.dart';
import 'package:final_project_edspert/application/questions/question_bloc.dart';
import 'package:final_project_edspert/application/users/profile_page/profile_page_bloc.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CourseBloc()),
        BlocProvider(create: (context) => ExerciseBloc()),
        BlocProvider(create: (context) => QuestionBloc()),
        BlocProvider(create: (context) => BannerBloc()),
        BlocProvider(create: (context) => ProfilePageBloc()),
      ],
      child: MaterialApp(
        scrollBehavior: _MyCustomScrollBehavior(),
        title: 'Edspert E-Learning',
        debugShowCheckedModeBanner: false,
        theme: ThemeApp.light,
        initialRoute: RouterApp.splashScreenPage,
        onGenerateRoute: RouterApp.onGenerateRoute,
        builder: EasyLoading.init(),
      ),
    );
  }
}

class _MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
