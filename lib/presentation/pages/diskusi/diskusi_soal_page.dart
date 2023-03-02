import 'package:final_project_edspert/presentation/pages/diskusi/widgets/diskusi_soal_chat_widget.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class DiskusiSoalPage extends StatelessWidget {
  const DiskusiSoalPage({super.key});

  static final _isiChats = {
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
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: Container(
        // height: 54,
        constraints: const BoxConstraints(minHeight: 54, maxHeight: 54 * 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: ColorsApp.offWhite,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                  fixedSize: const MaterialStatePropertyAll(Size.fromWidth(32)),
                  iconSize: const MaterialStatePropertyAll(32),
                  iconColor: MaterialStatePropertyAll(ColorsApp.primary),
                ),
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              width: 17,
            ),
            Expanded(
              child: TextFormField(
                minLines: null,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyleApp.titleDefault13.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      fixedSize:
                          const MaterialStatePropertyAll(Size.fromWidth(32)),
                      iconSize: const MaterialStatePropertyAll(32),
                      iconColor: MaterialStatePropertyAll(ColorsApp.primary),
                    ),
                    child: const Icon(Icons.camera_alt_rounded),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  hintText: 'Ketuk untuk menulis....',
                  hintStyle: TextStyleApp.titleDefault13.copyWith(
                    fontSize: 16,
                    color: ColorsApp.placeholder,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder:
                      Theme.of(context).inputDecorationTheme.border!.copyWith(
                            borderSide: BorderSide(
                              color: ColorsApp.titleActive,
                              width: 0.2,
                            ),
                          ),
                  enabledBorder: Theme.of(context).inputDecorationTheme.border,
                ),
              ),
            ),
            const SizedBox(
              width: 26,
            ),
            SizedBox(
              width: 32,
              height: 32,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                  fixedSize: const MaterialStatePropertyAll(Size.fromWidth(32)),
                  iconSize: const MaterialStatePropertyAll(32),
                  iconColor: MaterialStatePropertyAll(ColorsApp.primary),
                ),
                child: const Icon(Icons.send_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
