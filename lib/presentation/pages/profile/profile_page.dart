import 'package:final_project_edspert/presentation/utils/widgets/unsafe_color_widget.dart';
import 'package:final_project_edspert/presentation/pages/profile/widgets/profile_app_bar_widget.dart';
import 'package:final_project_edspert/presentation/pages/profile/widgets/profile_value_widget.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/colors_app.dart';

class ProfilePage extends UnsafeColorWidget {
  const ProfilePage({super.key}) : super(unsafeColor: ColorsApp.primary);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.backgroundPage,
      child: Column(
        children: [
          const SizedBox(height: 191, child: ProfileAppBarWidget()),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                    vertical: 18.79,
                  ),
                  constraints: const BoxConstraints(minHeight: 330),
                  decoration: BoxDecoration(
                    color: ColorsApp.offWhite,
                    borderRadius: BorderApp.radius1,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Identitas Diri',
                        style: TextStyleApp.largeTextDefault.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      for (var entry in {
                        'Nama Lengkap': 'Kevin Nicholas',
                        'Email': 'kevinnicholas2019@gmail.com',
                        'Jenis Kelamin': 'Laki-laki',
                        'Kelas': 'XII-IPA',
                        'Sekolah': 'SMAK 2 Penabur',
                      }.entries) ...[
                        ProfileValueWidget(
                          label: entry.key,
                          value: entry.value,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ]
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  height: 49,
                  decoration: BoxDecoration(
                    color: ColorsApp.offWhite,
                    borderRadius: BorderApp.radius1,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 20,
                        ),
                      ),
                      elevation: const MaterialStatePropertyAll(5),
                      shadowColor: MaterialStatePropertyAll(
                        Colors.black.withOpacity(0.2),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: ColorsApp.line,
                          ),
                          borderRadius: BorderApp.radius0,
                        ),
                      ),
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) {
                          const Set<MaterialState> interactiveStates =
                              <MaterialState>{
                            MaterialState.pressed,
                          };
                          if (states.any(interactiveStates.contains)) {
                            return ColorsApp.error.withOpacity(0.75);
                          }
                          return ColorsApp.error.withOpacity(0.25);
                        },
                      ),
                      iconSize: const MaterialStatePropertyAll(24),
                      iconColor: MaterialStateColor.resolveWith(
                        (states) {
                          const Set<MaterialState> interactiveStates =
                              <MaterialState>{
                            MaterialState.pressed,
                            MaterialState.focused,
                          };
                          if (states.any(interactiveStates.contains)) {
                            return ColorsApp.offWhite;
                          }
                          return ColorsApp.error;
                        },
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(ColorsApp.background),
                      foregroundColor: MaterialStateColor.resolveWith(
                        (states) {
                          const Set<MaterialState> interactiveStates =
                              <MaterialState>{
                            MaterialState.pressed,
                          };
                          if (states.any(interactiveStates.contains)) {
                            return ColorsApp.offWhite;
                          }
                          return ColorsApp.error;
                        },
                      ),
                      textStyle: MaterialStatePropertyAll(
                        TextStyleApp.largeTextDefault.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.logout_rounded),
                        SizedBox(width: 10),
                        Text('Keluar'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
