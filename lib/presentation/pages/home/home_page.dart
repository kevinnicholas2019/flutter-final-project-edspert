import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          color: ColorsApp.backgroundPage,
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              SizedBox(
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Hai, Altop',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Selamat Datang',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsApp.placeholder,
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/icons/kevin_nicholas_profile.jpg",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Container(
                height: 147,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorsApp.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        "assets/illustrations/home.png",
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Mau Kerjain',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontSize: 16,
                              color: ColorsApp.offWhite,
                            ),
                          ),
                          Text(
                            'latihan soal',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontSize: 16,
                              color: ColorsApp.offWhite,
                            ),
                          ),
                          Text(
                            'apa hari ini?',
                            style: TextStyleApp.largeTextDefault.copyWith(
                              fontSize: 16,
                              color: ColorsApp.offWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Pilih Pelajaran',
                      style: TextStyleApp.largeText20.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lihat Semua',
                        style: TextStyleApp.largeText20.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < 3; i++) ...[
                    Container(
                      color: ColorsApp.offWhite,
                      height: 96,
                      child: TextButton(
                        onPressed: () {},
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
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
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
                                    'Matematika',
                                    style:
                                        TextStyleApp.largeTextDefault.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '0/50 Paket latihan soal',
                                    style:
                                        TextStyleApp.largeTextDefault.copyWith(
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
                                    child: LinearProgressIndicator(
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
                    ),
                    if (i < 2)
                      const SizedBox(
                        height: 15,
                      ),
                  ],
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Terbaru',
                    style: TextStyleApp.largeTextDefault.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(
                        parent: ClampingScrollPhysics(),
                      ),
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var src in [
                          "https://eduhero.widyaedu.com/assets/images/thumbnail/e5c07ce5e92384a7631331a509300b3d.png",
                          "https://eduhero.widyaedu.com/assets/images/thumbnail/c65e092c0d25059a2987da176bdb14ae.png",
                          "https://eduhero.widyaedu.com/assets/images/thumbnail/4741c869709256593065fb43a2b6be68.png",
                          "https://widyaedu.com/blog/wp-content/uploads/2021/10/tasyi-mini.gif",
                          "https://widyaedu.com/blog/wp-content/uploads/2021/09/eduquiz-banner-app.jpg",
                        ]) ...[
                          ClipRRect(
                            borderRadius: BorderApp.radius,
                            child: TextButton(
                              onPressed: () {},
                              onLongPress: () {},
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.zero,
                                ),
                              ),
                              child: SizedBox(
                                width: 284,
                                height: 146,
                                child: Opacity(
                                  opacity: 1.0,
                                  child: CachedNetworkImage(
                                    imageUrl: src,
                                    fit: BoxFit.fitHeight,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (src !=
                              "https://widyaedu.com/blog/wp-content/uploads/2021/09/eduquiz-banner-app.jpg")
                            const SizedBox(
                              width: 29,
                            ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 57,
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
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(
                      const AssetImage("assets/icons/Quiz icon.png"),
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
