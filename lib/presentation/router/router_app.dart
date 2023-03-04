import 'package:final_project_edspert/presentation/pages/auth/login/login_page.dart';
import 'package:final_project_edspert/presentation/pages/auth/register/register_page.dart';
import 'package:final_project_edspert/presentation/pages/diskusi/diskusi_soal_page.dart';
import 'package:final_project_edspert/presentation/pages/home/home_page.dart';
import 'package:final_project_edspert/presentation/pages/mapel/kerjakan_soal/kerjakan_soal_page.dart';
import 'package:final_project_edspert/presentation/pages/mapel/paket_soal/pilih_paket_soal_page.dart';
import 'package:final_project_edspert/presentation/pages/mapel/pilih_mapel_page.dart';
import 'package:final_project_edspert/presentation/pages/profile/edit_profile/edit_profile_page.dart';
import 'package:final_project_edspert/presentation/pages/profile/profile_page.dart';
import 'package:final_project_edspert/presentation/pages/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static const String splashScreenPage = '/splash';
  static const String loginPage = '/login';
  static const String registerPage = '/register';
  static const String homePage = '/';
  static const String diskusiSoalPage = '/diskusi-soal';
  static const String profilePage = '/akun';
  static const String editProfilePage = '/edit-akun';
  static const String chooseSubjectsPage = '/pilih-mapel';
  static const String chooseQuestionPackagePage = '/pilih-paket-soal';
  static const String kerjakanSoalPage = '/kerjakan-soal';

  static const navigator = Navigator();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case RouterApp.splashScreenPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashScreenPage(),
          settings: settings,
        );
      case RouterApp.loginPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case RouterApp.registerPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const RegisterPage(),
          settings: settings,
        );
      case RouterApp.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case RouterApp.diskusiSoalPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const DiskusiSoalPage(),
          settings: settings,
        );
      case RouterApp.profilePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ProfilePage(),
          settings: settings,
        );
      case RouterApp.editProfilePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const EditProfilePage(),
          settings: settings,
        );
      case RouterApp.chooseSubjectsPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const PilihMapelPage(),
          settings: settings,
        );
      case RouterApp.chooseQuestionPackagePage:
        final String namaPelajaran = settings.arguments as String;
        return MaterialPageRoute<dynamic>(
          builder: (_) => PilihPaketSoalPage(
            namaPelajaran: namaPelajaran,
          ),
          settings: settings,
        );
      case RouterApp.kerjakanSoalPage:
        // final List<String> args = settings.arguments as List<String>;
        // final String namaPelajaran = args[0];
        // final String namaPaketSoal = args[1];
        return MaterialPageRoute<dynamic>(
          builder: (_) => KerjakanSoalPage(
            // namaPelajaran: namaPelajaran,
            // namaPaketSoal: namaPaketSoal,
            namaPelajaran: "Matematika",
            namaPaketSoal: "Trigonometri",
          ),
          settings: settings,
        );
      default:
        throw ErrorDescription("${settings.name} is not exists.");
    }
  }
}
