import 'package:final_project_edspert/domain/banners/banner.dart';
import 'package:final_project_edspert/domain/banners/i_banner_repository.dart';
import 'package:final_project_edspert/infrastructure/banners/banner_api.dart';
import 'package:final_project_edspert/infrastructure/banners/hive_banner_repo.dart';
import 'package:flutter/foundation.dart';

class BannerDataSource implements IBannerRepository {
  final _api = BannerApi();
  final _repo = HiveBannerRepo();

  @override
  Future<List<Banner>> getBanners() async {
    try {
      final banners = await _api.getBanners();
      if (banners.isNotEmpty) {
        await _repo.saveBanners(banners);
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
    return await _repo.getBanners();
  }
}
