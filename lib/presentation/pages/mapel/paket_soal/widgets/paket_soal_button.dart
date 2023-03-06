import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class PaketSoalButton extends StatelessWidget {
  static Function() _defaultOnPressed(
          BuildContext context, String namaPaketSoal) =>
      () {
        Navigator.pushNamed(
          context,
          RouterApp.kerjakanSoalPage,
          arguments: namaPaketSoal,
        );
      };

  final String namaPaketSoal;
  final int totalSoal;
  final Function()? onPressed;

  const PaketSoalButton({
    super.key,
    required this.namaPaketSoal,
    this.totalSoal = 0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
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
      child: TextButton(
        onPressed: totalSoal > 0
            ? onPressed ?? _defaultOnPressed(context, namaPaketSoal)
            : null,
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(12.0)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderApp.radius1,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 36,
              height: 36,
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: ColorsApp.placeholder.withOpacity(0.175),
                borderRadius: BorderApp.radius1,
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
            const SizedBox(height: 7),
            Text(
              namaPaketSoal,
              style: TextStyleApp.largeTextDefault.copyWith(
                fontSize: 12,
              ),
            ),
            Text(
              totalSoal == 0 ? 'soal kosong' : '0/$totalSoal soal',
              style: TextStyleApp.largeTextDefault.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: ColorsApp.placeholder,
              ),
            ),
            const SizedBox(
              height: 11,
            ),
          ],
        ),
      ),
    );
  }
}
