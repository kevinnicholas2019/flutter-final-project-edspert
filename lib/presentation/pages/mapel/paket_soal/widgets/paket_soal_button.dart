import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_edspert/infrastructure/questions/question_api.dart';
import 'package:final_project_edspert/presentation/pages/mapel/kerjakan_soal/kerjakan_soal_page.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class PaketSoalButton extends StatelessWidget {
  static bool isOnPressed = false;

  static Function() _defaultOnPressed(
          BuildContext context, String exerciseId) =>
      () async {
        if (!isOnPressed) {
          isOnPressed = true;
          KerjakanSoalPage.exercises =
              await QuestionApi().getQuestions(exerciseId);
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(
            context,
            RouterApp.kerjakanSoalPage,
            arguments: exerciseId,
            // arguments: {
            //   "namaPaketSoal": namaPaketSoal,
            //   "exerciseId": exerciseId,
            // },
          );
          isOnPressed = false;
        }
      };

  final String exerciseId;
  final String namaPaketSoal;
  final int totalSoal;
  final Function()? onPressed;
  final String icon;

  const PaketSoalButton({
    super.key,
    required this.namaPaketSoal,
    this.totalSoal = 0,
    this.onPressed,
    required this.icon,
    required this.exerciseId,
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
            ? onPressed ?? _defaultOnPressed(context, exerciseId)
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
                imageUrl: icon,
                fit: BoxFit.fitHeight,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
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
