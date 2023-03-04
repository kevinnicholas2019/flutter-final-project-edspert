import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class MapelButton extends StatelessWidget {
  static Function() _defaultOnPressed(
          BuildContext context, String namaPelajaran) =>
      () {
        Navigator.pushNamed(
          context,
          RouterApp.chooseQuestionPackagePage,
          arguments: namaPelajaran,
        );
      };

  final String namaMapel;
  final int totalLatihanSoal;
  final double progressIndicatorValue;
  final Function()? onPressed;

  const MapelButton({
    super.key,
    required this.namaMapel,
    this.totalLatihanSoal = 0,
    this.progressIndicatorValue = 0.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.offWhite,
      height: 96,
      child: TextButton(
        onPressed: totalLatihanSoal > 0
            ? onPressed ?? _defaultOnPressed(context, namaMapel)
            : null,
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.all(20.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 53,
              height: 53,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: ColorsApp.placeholder.withOpacity(0.175),
                borderRadius: BorderApp.radius,
              ),
              child: CachedNetworkImage(
                imageUrl:
                    "https://api.widyaedu.com/assets/uploads/icon/5a6d6c735a56396a62335a6c636a45324e4441794d6a677a4e44633d_file_cover1640228347.png",
                fit: BoxFit.fitHeight,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 9,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    namaMapel,
                    style: TextStyleApp.largeTextDefault.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    totalLatihanSoal == 0
                        ? 'latihan soal kosong'
                        : '0/$totalLatihanSoal Paket latihan soal',
                    style: TextStyleApp.largeTextDefault.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorsApp.placeholder,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  ClipRRect(
                    borderRadius: BorderApp.radius,
                    child: const LinearProgressIndicator(
                      value: 0.25,
                      color: ColorsApp.primary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
