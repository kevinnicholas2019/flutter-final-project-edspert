import 'package:final_project_edspert/presentation/pages/profile/widgets/profile_app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: Column(
            children: [
              const ProfileAppBarWidget(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
