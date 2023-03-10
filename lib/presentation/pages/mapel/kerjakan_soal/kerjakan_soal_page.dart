import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/html_style_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:final_project_edspert/presentation/utils/widgets/app_bar_default.dart';
import 'package:final_project_edspert/presentation/utils/widgets/text_button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class KerjakanSoalPage extends StatefulWidget {
  static List<dynamic> exercises = [];

  final String namaPelajaran;
  final String namaPaketSoal;
  final String exerciseId;

  const KerjakanSoalPage({
    super.key,
    required this.namaPelajaran,
    required this.namaPaketSoal,
    required this.exerciseId,
  });

  @override
  State<KerjakanSoalPage> createState() => _KerjakanSoalPageState();
}

class _KerjakanSoalPageState extends State<KerjakanSoalPage> {
  int _currentSoal = 1;

  final List<dynamic> _exercises = KerjakanSoalPage.exercises
      .map(
        (e) => {
          ...e,
          "choosed": null,
        },
      )
      .toList();

  final _onBottomSheetDelay = const Duration(milliseconds: 350);
  final _onPressDurationDelay = const Duration(milliseconds: 150);

  bool _isModalKumpulkanActive = false;
  double _opacityBottomSheet = 0;
  double _bottomSheetPositionedBottom = -308;

  @override
  Widget build(BuildContext context) {
    final isAllChoosed = _exercises.fold(
      true,
      (previousValue, element) => previousValue && element["choosed"] != null,
    );
    return Scaffold(
      appBar: AppBarDefault.make(
        title: 'Latihan Soal',
      ),
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 46,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 1; i <= _exercises.length; i++) ...[
                          SizedBox(
                            width: 23,
                            height: 23,
                            child: TextButton(
                              onPressed: () {
                                _currentSoal = i;
                                setState(() {});
                              },
                              style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                  EdgeInsets.zero,
                                ),
                                shape: MaterialStatePropertyAll(
                                  CircleBorder(
                                    side: BorderSide(
                                      color: ColorsApp.secondary,
                                      width: i == _currentSoal ? 3 : 1,
                                    ),
                                  ),
                                ),
                                overlayColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    const Set<MaterialState> interactiveStates =
                                        <MaterialState>{
                                      MaterialState.pressed,
                                    };
                                    if (states
                                        .any(interactiveStates.contains)) {
                                      return ColorsApp.secondary
                                          .withOpacity(0.375);
                                    }
                                    return ColorsApp.secondary
                                        .withOpacity(0.25);
                                  },
                                ),
                                iconColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    return Colors.black.withOpacity(0.5);
                                  },
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  _exercises[i - 1]["choosed"] != null
                                      ? ColorsApp.primary
                                      : ColorsApp.offWhite,
                                ),
                                foregroundColor: MaterialStatePropertyAll(
                                  _exercises[i - 1]["choosed"] != null
                                      ? ColorsApp.offWhite
                                      : ColorsApp.primary,
                                ),
                                textStyle: MaterialStatePropertyAll(
                                  TextStyleApp.largeTextDefault.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.5,
                                  ),
                                ),
                              ),
                              child: Text(i.toString()),
                            ),
                          ),
                          if (i < 20) const SizedBox(width: 10),
                        ]
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 25,
                      ),
                      children: [
                        Text(
                          'Soal Nomor $_currentSoal',
                          style: TextStyleApp.largeTextDefault.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ColorsApp.titleDisable,
                          ),
                        ),
                        const SizedBox(height: 7),
                        if (_exercises[_currentSoal - 1]["question_title"] !=
                            "") ...[
                          Html(
                            onLinkTap: (url, _, __, ___) async => url != null
                                ? await launchUrl(
                                    Uri.parse(url),
                                    mode: LaunchMode.externalApplication,
                                  )
                                : () {},
                            data: _exercises[_currentSoal - 1]["question_title"]
                                as String,
                            style: HtmlStyleApp.soalStyle,
                          ),
                        ],
                        if (_exercises[_currentSoal - 1]
                                ["question_title_img"] !=
                            null) ...[
                          const SizedBox(height: 10),
                          CachedNetworkImage(
                              imageUrl: _exercises[_currentSoal - 1]
                                  ["question_title_img"]),
                        ],
                        const SizedBox(height: 25.5),
                        for (var i = 65,
                                choosed =
                                    _exercises[_currentSoal - 1]["choosed"];
                            i < 70;
                            i++) ...[
                          TextButton(
                            onPressed: () async {
                              return await Future.delayed(
                                _onPressDurationDelay,
                                () {
                                  _exercises[_currentSoal - 1]["choosed"] =
                                      choosed == String.fromCharCode(i)
                                          ? null
                                          : String.fromCharCode(i);
                                  setState(() {});
                                },
                              );
                            },
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                  vertical: 23,
                                  horizontal: 23,
                                ),
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 1,
                                    color: ColorsApp.line,
                                  ),
                                  borderRadius: BorderApp.radius1,
                                ),
                              ),
                              overlayColor: MaterialStateColor.resolveWith(
                                (states) {
                                  const Set<MaterialState> interactiveStates =
                                      <MaterialState>{
                                    MaterialState.pressed,
                                  };
                                  if (states.any(interactiveStates.contains)) {
                                    return ColorsApp.secondary
                                        .withOpacity(0.375);
                                  }
                                  return ColorsApp.secondary.withOpacity(0.25);
                                },
                              ),
                              iconColor: MaterialStateColor.resolveWith(
                                (states) {
                                  return Colors.black.withOpacity(0.5);
                                },
                              ),
                              backgroundColor: MaterialStatePropertyAll(
                                String.fromCharCode(i) == choosed
                                    ? ColorsApp.primary
                                    : ColorsApp.background,
                              ),
                              foregroundColor: MaterialStatePropertyAll(
                                String.fromCharCode(i) == choosed
                                    ? ColorsApp.offWhite
                                    : ColorsApp.titleActive,
                              ),
                              textStyle: MaterialStatePropertyAll(
                                TextStyleApp.largeTextDefault.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${String.fromCharCode(i)}.'),
                                const SizedBox(width: 7),
                                Flexible(
                                  child: Html(
                                    data:
                                        "${_exercises[_currentSoal - 1]["option_${String.fromCharCode(i).toLowerCase()}"] as String}${_exercises[_currentSoal - 1]["option_${String.fromCharCode(i).toLowerCase()}_img"] != null ? "<img src='${_exercises[_currentSoal - 1]["option_${String.fromCharCode(i).toLowerCase()}_img"]}' />" : ""}",
                                    style: String.fromCharCode(i) == choosed
                                        ? HtmlStyleApp.jawabanChoosedStyle
                                        : HtmlStyleApp.jawabanStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                        const SizedBox(height: 14),
                        if (isAllChoosed || _currentSoal < _exercises.length)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 135,
                                child: TextButtonApp.textButtonCustom2(
                                  isAllChoosed ? 'Kumpulkan' : 'Selanjutnya',
                                  textStyle:
                                      TextStyleApp.largeTextDefault.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                  onPressed: () async {
                                    return await Future.delayed(
                                        _onPressDurationDelay,
                                        isAllChoosed
                                            ? _onBottomSheetOpen
                                            : _onSelanjutnya);
                                  },
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_isModalKumpulkanActive) ...[
                Positioned.fill(
                  child: AnimatedContainer(
                    color: Colors.black.withOpacity(_opacityBottomSheet),
                    duration: _onBottomSheetDelay,
                  ),
                ),
                AnimatedPositioned(
                  duration: _onBottomSheetDelay,
                  bottom: _bottomSheetPositionedBottom,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.localPosition.dy > 0) {
                        setState(() {
                          _bottomSheetPositionedBottom =
                              -details.localPosition.dy;
                        });
                      }
                    },
                    onVerticalDragEnd: (_) {
                      final needClose = _bottomSheetPositionedBottom < -308 / 2;
                      if (needClose) {
                        _onBottomSheetClose();
                      } else {
                        setState(() {
                          _bottomSheetPositionedBottom = 0;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 308,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 36,
                        vertical: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: ColorsApp.offWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 89,
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC4C4C4),
                              borderRadius: BorderApp.radius0,
                            ),
                          ),
                          const SizedBox(height: 22),
                          Image.asset("assets/illustrations/kumpulkan.png"),
                          const SizedBox(height: 9),
                          Text(
                            'Kumpulkan latihan soal sekarang?',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Boleh langsung kumpulin dong',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: ColorsApp.titleDisable,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButtonApp.textButtonCustom3(
                                'Nanti dulu',
                                onPressed: _onBottomSheetClose,
                              ),
                              const SizedBox(width: 13),
                              TextButtonApp.textButtonCustom2(
                                'Ya',
                                onPressed: () => Navigator.popAndPushNamed(
                                  context,
                                  RouterApp.hasilPage,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  _onSelanjutnya() {
    if (_currentSoal < _exercises.length) {
      _currentSoal++;
      setState(() {});
    }
  }

  _onBottomSheetOpen() {
    _isModalKumpulkanActive = true;
    setState(() {});
    Future.delayed(_onPressDurationDelay - const Duration(milliseconds: 100),
        () {
      setState(() {
        _opacityBottomSheet = 0.5;
        _bottomSheetPositionedBottom = 0;
      });
    });
  }

  _onBottomSheetClose() {
    setState(() {
      _opacityBottomSheet = 0.0;
      _bottomSheetPositionedBottom = -380.0;
    });
    Future.delayed(_onBottomSheetDelay + _onPressDurationDelay, () {
      _isModalKumpulkanActive = false;
      setState(() {});
    });
  }
}
