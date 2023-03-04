import 'package:final_project_edspert/presentation/pages/mapel/widgets/mapel_button.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';

class PilihMapelPage extends StatelessWidget {
  const PilihMapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault.make(
        title: 'Pilih Pelajaran',
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              for (var i = 0; i < 6; i++) ...[
                const MapelButton(
                  namaMapel: 'Matematika',
                  totalLatihanSoal: 50,
                ),
                if (i < 5)
                  const SizedBox(
                    height: 15,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
