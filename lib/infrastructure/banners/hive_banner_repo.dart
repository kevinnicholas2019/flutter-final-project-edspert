import 'package:final_project_edspert/domain/banners/banner.dart';
import 'package:final_project_edspert/domain/banners/i_banner_repository.dart';
import 'package:final_project_edspert/infrastructure/banners/banner_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

class HiveBannerRepo implements IBannerRepository {
  @override
  Future<List<Banner>> getBanners() async {
    final bannerBox = await Hive.openBox<Map>('banner');

    final List<Banner> banners = bannerBox.values
        .map((e) => BannerDto.fromJson(e.cast<String, dynamic>()).toDomain())
        .toList();

    await bannerBox.close();

    return banners;
  }

  Future<void> saveBanners(List<Banner> banners) async {
    final bannerBox = await Hive.openBox<Map>('banner');
    final bannerFromBox = bannerBox.values;
    final List<Banner> bannerFromHive = bannerFromBox.isNotEmpty
        ? bannerFromBox
            .map(
                (e) => BannerDto.fromJson(e.cast<String, dynamic>()).toDomain())
            .toList()
        : [];

    if (bannerFromBox.isNotEmpty ||
        listEquals(bannerFromHive, banners) == false) {
      await bannerBox.clear();
      await bannerBox.addAll(
        banners.map((e) => BannerDto.fromDomain(e).toJson()).toList(),
      );
    }

    await bannerBox.close();
  }
}
