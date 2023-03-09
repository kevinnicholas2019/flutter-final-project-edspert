import 'dart:io';

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
