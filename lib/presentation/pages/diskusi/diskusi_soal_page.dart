import 'package:final_project_edspert/presentation/pages/diskusi/widgets/diskusi_soal_bottom_nav.dart';
import 'package:final_project_edspert/presentation/pages/diskusi/widgets/diskusi_soal_chat_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class DiskusiSoalPage extends StatelessWidget {
  const DiskusiSoalPage({super.key});

  static final _isiChats = [
    for (var i = 0; i < 3; i++) ...[
      {
        "nama": "Tutor Arin",
        "pesan":
            "Halo, Perkenalkan saya Arin yang akan menjadi pembimbing kalian di grub ini.",
        "waktu": "29m",
      },
      {
        "nama": "Saya",
        "pesan": "Baik Kak, terima kasih",
        "waktu": "29m",
        "isDiriSendiri": true,
      },
      {
        "nama": "Andy",
        "pesan": "Halo semua saya Andika dari SMAN 3 Yogyakarta.",
        "waktu": "30m",
      },
      {
        "nama": "Karina",
        "pesan": "Halo semua saya Karina dari SMAN 1 Surabaya.",
        "waktu": "30m",
      },
      {
        "nama": "Bayu",
        "pesan": "Halo semua saya Bayu dari SMAN 3 Yogyakarta.",
        "waktu": "30m",
      },
      {
        "nama": "Naufal",
        "pesan": "Halo semua saya Naufal dari SMAN 1 Yogyakarta.",
        "waktu": "30m",
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        titleTextStyle: TextStyleApp.largeTextDefault.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: ColorsApp.offWhite,
        ),
        title: const Text(
          'Diskusi Soal',
        ),
        centerTitle: true,
        backgroundColor: ColorsApp.primary,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: ColorsApp.backgroundPage,
                child: ListView(
                  padding: const EdgeInsets.all(20.0),
                  children: [
                    for (var entry in _isiChats) ...[
                      DiskusiSoalChatWidget(
                        nama: entry["nama"]! as String,
                        pesan: entry["pesan"]! as String,
                        waktu: entry["waktu"]! as String,
                        isDirisendiri: entry["isDiriSendiri"] != null
                            ? entry["isDiriSendiri"] as bool
                            : false,
                      ),
                      if (_isiChats.last != entry) const SizedBox(height: 16),
                    ],
                  ],
                ),
              ),
            ),
            const DiskusiSoalBottomNav(),
          ],
        ),
      ),
    );
  }
}
