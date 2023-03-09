import 'package:dio/dio.dart';
import 'package:final_project_edspert/presentation/app_widget.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:final_project_edspert/firebase_options.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppWidget());
}

// void main() async {
//   final dio = Dio()
//     ..options.headers['x-api-key'] = '18be70c0-4e4d-44ff-a475-50c51ece99a0';
//   final Response<Map> response = await dio.get(
//       "https://edspert.widyaedu.com/exercise/data_course?major_name=IPA&user_email=testerngbayu@gmail.com");
//   final Response<Map> response2 = await dio.get(
//       "https://edspert.widyaedu.com/exercise/data_course?major_name=IPS&user_email=testerngbayu@gmail.com");

//   for (var data in [
//     ...response.data!["data"],
//     ...response2.data!["data"],
//   ]) {
//     print(data);
//   }
// }
