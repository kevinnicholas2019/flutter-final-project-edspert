import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_edspert/application/banners/banner_bloc.dart';
import 'package:final_project_edspert/application/courses/course_bloc.dart';
import 'package:final_project_edspert/application/users/profile_page/profile_page_bloc.dart';
import 'package:final_project_edspert/presentation/utils/widgets/unsafe_color_widget.dart';
import 'package:final_project_edspert/presentation/pages/mapel/widgets/mapel_button.dart';
import 'package:final_project_edspert/presentation/router/router_app.dart';
import 'package:final_project_edspert/presentation/utils/border_app.dart';
import 'package:final_project_edspert/presentation/utils/colors_app.dart';
import 'package:final_project_edspert/presentation/utils/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeWidget extends UnsafeColorWidget {
  const HomeWidget({super.key}) : super(unsafeColor: ColorsApp.backgroundPage);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.backgroundPage,
      child: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SizedBox(
            height: 35,
            child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
              builder: (context, state) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Hai, ${state.user.namaLengkap.value}',
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
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: "${state.firebaseCredential.photoURL}",
                        width: 35,
                        height: 35,
                        placeholder: (_, __) => Container(
                          width: 35,
                          height: 35,
                          color: ColorsApp.placeholder,
                        ),
                      ),
                    ),
                  ],
                );
              },
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
              borderRadius: BorderApp.radius2,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
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
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RouterApp.chooseSubjectsPage,
                  ),
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
          BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseOnSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var course in state.courses.take(3)) ...[
                      MapelButton(
                        courseId: course.id.value,
                        namaMapel: course.courseName.value,
                        totalPaketLatihanSoal: course.jumlahMateri.value,
                        imageUrl: course.urlCover.value,
                      ),
                      if (state.courses.last != course)
                        const SizedBox(
                          height: 15,
                        ),
                    ],
                  ],
                );
              } else if (state is CourseOnFail) {}

              return const Center(child: CircularProgressIndicator());
            },
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
                child: BlocBuilder<BannerBloc, BannerState>(
                  builder: (context, state) {
                    if (state is BannerOnFail) {
                      return Center(
                        child: TextButton(
                          onPressed: () => BlocProvider.of<BannerBloc>(context)
                              .add(OnGetBanners()),
                          child: const Text('Refresh'),
                        ),
                      );
                    }
                    if (state is BannerOnSuccess) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(
                          parent: ClampingScrollPhysics(),
                        ),
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var banner in state.banners) ...[
                            ClipRRect(
                              borderRadius: BorderApp.radius0,
                              child: TextButton(
                                onPressed: () async => banner.url
                                        .failures()
                                        .isEmpty
                                    ? await launchUrl(
                                        Uri.parse(banner.url.value),
                                        mode: LaunchMode.externalApplication,
                                      )
                                    : () {},
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
                                      imageUrl: banner.image.value,
                                      fit: BoxFit.fitHeight,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                            ),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (state.banners.last != banner)
                              const SizedBox(
                                width: 29,
                              ),
                          ],
                        ],
                      );
                    } else if (state is BannerOnFail) {}

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 27,
          ),
        ],
      ),
    );
  }
}
