import 'package:equatable/equatable.dart';
import 'package:final_project_edspert/presentation/app_widget.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:final_project_edspert/firebase_options.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  Hive.initFlutter();
  EquatableConfig.stringify = true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AppWidget());
}
