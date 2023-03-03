import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

const _radius = 20.0;

class BottomNavigationBarItemApp {
  final String title;
  final String? icon;
  final Function() navigationTo;

  const BottomNavigationBarItemApp({
    required this.title,
    this.icon,
    required this.navigationTo,
  });
}

class BottomNavigationBarApp extends StatelessWidget {
  // static final _clipper = _CustomClipPath();

  final List<BottomNavigationBarItemApp> listBottomNavigationBarItemApp;
  final FloatingActionButton? floatingActionButton;

  const BottomNavigationBarApp({
    super.key,
    required this.listBottomNavigationBarItemApp,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    color: Colors.black.withOpacity(0.15),
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
                  for (var baritem in listBottomNavigationBarItemApp)
                    Expanded(
                      child: TextButton(
                        onPressed: baritem.navigationTo,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (baritem.icon != null)
                              Image.asset(
                                baritem.icon!,
                                width: 20,
                                height: 20,
                              ),
                            if (baritem.icon == null)
                              const SizedBox(
                                height: 20,
                              ),
                            Text(
                              baritem.title,
                              style: TextStyleApp.largeTextDefault.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (floatingActionButton != null)
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 50,
                height: 50,
                child: floatingActionButton,
              ),
            ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// ignore: unused_element
class _CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var radius = _radius;
    double heightStart = 0;

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
