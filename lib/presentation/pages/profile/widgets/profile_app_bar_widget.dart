import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:flutter/material.dart';

import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 191,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: ColorsApp.primary,
        borderRadius: BorderApp.radius.copyWith(
          topLeft: Radius.zero,
          topRight: Radius.zero,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Akun Saya',
                    style: TextStyleApp.largeTextDefault.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: ColorsApp.offWhite,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 27,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        RouterApp.editProfilePage,
                      ),
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.all(0),
                        ),
                        overlayColor: MaterialStatePropertyAll(
                          ColorsApp.offWhite.withOpacity(0.1),
                        ),
                        foregroundColor: const MaterialStatePropertyAll(
                          ColorsApp.offWhite,
                        ),
                        textStyle: MaterialStatePropertyAll(
                          TextStyleApp.largeTextDefault.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      child: const Text('Edit'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 28.86,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kevin Nicholas',
                      style: TextStyleApp.largeTextDefault.copyWith(
                        fontSize: 20,
                        color: ColorsApp.offWhite,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 10.11,
                    ),
                    Text(
                      'SMAK 2 Penabur',
                      style: TextStyleApp.largeTextDefault.copyWith(
                        fontSize: 12,
                        color: ColorsApp.offWhite,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Align(
                  alignment: const Alignment(0, -0.5),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://pps.whatsapp.net/v/t61.24694-24/321243037_1518504015337246_465266283058870689_n.jpg?stp=dst-jpg_s96x96&ccb=11-4&oh=01_AdR1Xz4VZiPJzWU56RttXR94AbGfl26yo8q-CQVorc2Xng&oe=640DCC7C",
                      width: 52,
                      height: 52,
                      placeholder: (_, __) => Container(
                        width: 52,
                        height: 52,
                        color: ColorsApp.placeholder,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
