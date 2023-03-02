import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class DiskusiSoalChatWidget extends StatelessWidget {
  final String nama;
  final String pesan;
  final String waktu;
  final bool isDirisendiri;
  final Color colorTextNama;
  final Color colorBgChat;
  final Color colorTextChat;

  const DiskusiSoalChatWidget({
    super.key,
    required this.nama,
    required this.pesan,
    required this.waktu,
    this.isDirisendiri = false,
    this.colorTextNama = const Color(0xFF00C4FF),
    this.colorBgChat = const Color(0xFFE0F8FF),
    this.colorTextChat = ColorsApp.titleActive,
  });

  static const double _maxWidthOffsetText = 675;

  @override
  Widget build(BuildContext context) {
    final double widthOffsetTextInit = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.175);
    final double widthOffsetText = widthOffsetTextInit > _maxWidthOffsetText
        ? _maxWidthOffsetText
        : widthOffsetTextInit;

    return Column(
      crossAxisAlignment:
          !isDirisendiri ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          nama,
          style: TextStyleApp.largeTextDefault.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: const Color(0xFF00C4FF),
          ),
        ),
        const SizedBox(height: 7),
        Container(
          constraints: BoxConstraints(
            maxWidth: widthOffsetText,
          ),
          padding: const EdgeInsets.only(
            left: 14,
            top: 14,
            bottom: 14,
            right: 14,
          ),
          color: const Color(0xFFE0F8FF),
          child: Text(
            pesan,
            style: TextStyleApp.largeTextDefault.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: ColorsApp.titleActive,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          waktu,
          style: TextStyleApp.titleDefault.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 10,
            color: ColorsApp.label,
          ),
        ),
      ],
    );
  }
}
