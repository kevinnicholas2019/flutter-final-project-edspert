import 'package:final_project_edspert/presentation/pages/mapel/widgets/mapel_button.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';

class PilihPaketSoalPage extends StatelessWidget {
  final String namaPelajaran;

  const PilihPaketSoalPage({super.key, required this.namaPelajaran});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.make(
        title: namaPelajaran,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [],
          ),
        ),
      ),
    );
  }
}
