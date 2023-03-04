import 'package:final_project_edspert/presentation/pages/mapel/widgets/mapel_button.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'dart:math' as math;

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
          child: GridView.count(
            childAspectRatio: math.max(316 / 96, 1.0),
            crossAxisCount:
                math.max((MediaQuery.of(context).size.width ~/ 316).toInt(), 1),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            padding: const EdgeInsets.all(20),
            children: [
              for (var i = 0; i < 6; i++)
                const MapelButton(
                  namaMapel: 'Matematika',
                  totalPaketLatihanSoal: 50,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
