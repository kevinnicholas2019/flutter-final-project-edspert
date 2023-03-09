import 'package:final_project_edspert/domain/banners/banner.dart';
import 'package:final_project_edspert/infrastructure/banners/banner_datasaource.dart';

abstract class IBannerRepository {
  static final IBannerRepository _instance = BannerDataSource();
  factory IBannerRepository() => _instance;

  Future<List<Banner>> getBanners();
}
