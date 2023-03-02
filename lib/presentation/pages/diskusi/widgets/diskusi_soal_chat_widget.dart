import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class DiskusiSoalChatWidget extends StatelessWidget {
  final Color _penggunaColorTextNama = ColorsApp.secondary;
  final Color _penggunaColorBgChat = ColorsApp.primary;
  final Color _penggunaColorTextChat = ColorsApp.offWhite;

  final Radius _borderRadiusChat = const Radius.circular(12);

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
            color: isDirisendiri ? _penggunaColorTextNama : colorTextNama,
          ),
        ),
        const SizedBox(height: 7),
        Container(
          constraints: BoxConstraints(
            maxWidth: widthOffsetText,
          ),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isDirisendiri ? _penggunaColorBgChat : colorBgChat,
            borderRadius: BorderRadius.only(
              topLeft: isDirisendiri ? _borderRadiusChat : Radius.zero,
              topRight: isDirisendiri ? Radius.zero : Radius.zero,
              bottomRight: _borderRadiusChat,
              bottomLeft: _borderRadiusChat,
            ),
          ),
          child: Text(
            pesan,
            style: TextStyleApp.largeTextDefault.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: isDirisendiri ? _penggunaColorTextChat : colorTextChat,
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
