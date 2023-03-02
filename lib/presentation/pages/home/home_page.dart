import 'package:final_project_edspert/presentation/pages/home/widget/bottom_navigation_bar_app.dart';
import 'package:final_project_edspert/presentation/pages/home/widget/home_widget.dart';
import 'package:final_project_edspert/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          children: const [
            Positioned.fill(
              bottom: 53,
              child: ProfilePage(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottonNavigationBarApp(),
            ),
          ],
        ),
      ),
    );
  }
}
