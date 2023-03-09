import 'package:final_project_edspert/domain/banners/banner.dart';
import 'package:final_project_edspert/domain/banners/i_banner_repository.dart';
import 'package:final_project_edspert/infrastructure/banners/banner_dto.dart';
import 'package:hive_flutter/adapters.dart';

class HiveBannerRepo implements IBannerRepository {
  @override
  Future<List<Banner>> getBanners() async {
    final bannerBox = await Hive.openBox<Map>('banner');

    var banners = <Banner>[];
    for (var banner in bannerBox.values) {
      banners
          .add(BannerDto.fromJson(banner.cast<String, dynamic>()).toDomain());
    }

    await bannerBox.close();

    return banners;
  }

  Future<void> saveBanners(List<Banner> banners) async {
    final bannerBox = await Hive.openBox<Map<String, dynamic>>('banner');
    if (bannerBox.isNotEmpty) {
      await bannerBox.clear();
    }
    for (var banner in banners) {
      await bannerBox.add(BannerDto.fromDomain(banner).toJson());
    }
    await bannerBox.close();
  }
}
