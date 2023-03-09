import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project_edspert/presentation/app_widget.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:final_project_edspert/firebase_options.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  // HttpOverrides.global = MyHttpOverrides();
  Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppWidget());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// void main() async {
//   final dio = Dio()
//     ..options.headers['x-api-key'] = '18be70c0-4e4d-44ff-a475-50c51ece99a0';
//   final Response<Map> response = await dio.get(
//       "https://edspert.widyaedu.com/exercise/data_exercise?course_id=132&user_email=testerngbayu@gmail.com");

//   for (var data in response.data!["data"]) {
//     print(data);
//   }
// }
