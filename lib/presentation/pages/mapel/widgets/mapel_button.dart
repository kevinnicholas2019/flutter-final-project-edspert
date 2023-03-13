import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class MapelButton extends StatelessWidget {
  static Function() _defaultOnPressed(
          BuildContext context, int? courseId, String namaPelajaran) =>
      () {
        if (courseId == null) {
          return;
        }
        Navigator.pushNamed(
          context,
          RouterApp.chooseQuestionPackagePage,
          arguments: {
            "courseId": courseId.toString(),
            "namaPelajaran": namaPelajaran,
          },
        );
      };

  final int? courseId;
  final String namaMapel;
  final int totalPaketLatihanSoal;
  final double progressIndicatorValue;
  final String imageUrl;
  final Function()? onPressed;

  const MapelButton({
    super.key,
    this.courseId,
    required this.namaMapel,
    this.totalPaketLatihanSoal = 0,
    this.progressIndicatorValue = 0.0,
    required this.imageUrl,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.offWhite,
        borderRadius: BorderApp.radius1,
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 5,
        //     spreadRadius: 1,
        //     offset: const Offset(0, 0),
        //   ),
        // ],
      ),
      height: 96,
      child: TextButton(
        onPressed: onPressed ?? _defaultOnPressed(context, courseId, namaMapel),
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(12.0)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderApp.radius1,
            ),
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
                borderRadius: BorderApp.radius1,
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
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
                    totalPaketLatihanSoal == 0
                        ? 'latihan soal kosong'
                        : '0/$totalPaketLatihanSoal Paket latihan soal',
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
                    borderRadius: BorderApp.radius0,
                    child: LinearProgressIndicator(
                      value: progressIndicatorValue,
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
