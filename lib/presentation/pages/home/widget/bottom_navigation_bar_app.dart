import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

const _radius = 20.0;

class BottonNavigationBarApp extends StatelessWidget {
  const BottonNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        height: 80,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: ColorsApp.offWhite,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(_radius),
                    topRight: Radius.circular(_radius),
                  ),
                ),
                child: Row(
                  children: [
                    for (var entry in {
                      "Home": "assets/icons/nav_toggle_on/home.png",
                      "Diskusi Soal":
                          "assets/icons/nav_toggle_off/diskusi_soal.png",
                      "Profile": "assets/icons/nav_toggle_off/profile.png",
                    }.entries)
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (entry.key != "Diskusi Soal")
                                Image.asset(
                                  entry.value,
                                  width: 20,
                                  height: 20,
                                ),
                              if (entry.key == "Diskusi Soal")
                                const SizedBox(
                                  height: 20,
                                ),
                              Text(
                                entry.key,
                                style: TextStyleApp.largeTextDefault.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 50,
                height: 50,
                child: FloatingActionButton.large(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage("assets/icons/Quiz icon.png"),
                      color: ColorsApp.offWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var radius = _radius;
    double heightStart = 25;

    Path path = Path()
      ..moveTo(0, heightStart + radius)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, heightStart + radius)
      ..arcToPoint(Offset(size.width - radius, heightStart),
          radius: Radius.circular(radius), clockwise: false)
      //button slice start
      ..lineTo(size.width / 2 + 25, heightStart)
      ..arcToPoint(Offset(size.width / 2, 0),
          radius: Radius.circular(radius), clockwise: false)
      ..arcToPoint(Offset(size.width / 2 - 25, heightStart),
          radius: Radius.circular(radius), clockwise: false)
      //button slice end
      ..lineTo(radius, heightStart)
      ..arcToPoint(Offset(0, heightStart + radius),
          radius: Radius.circular(radius), clockwise: false)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
