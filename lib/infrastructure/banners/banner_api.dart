import 'package:dio/dio.dart';
import 'package:final_project_edspert/domain/banners/banner.dart';
import 'package:final_project_edspert/domain/banners/i_banner_repository.dart';
import 'package:final_project_edspert/infrastructure/banners/banner_dto.dart';
import 'package:final_project_edspert/infrastructure/core/api.dart';

class BannerApi extends Api implements IBannerRepository {
  @override
  String get apiUrl => "${super.apiUrl}event/list";

  @override
  Future<List<Banner>> getBanners() async {
    final Response<Map> response = await dio.get("$apiUrl?limit5");
    final data = response.data;
    if (data == null) {
      throw Error();
    }
    final banners = <Banner>[];
    if (data["status"] == 1) {
      final listBanner = data["data"];
      for (var bannerJson in listBanner) {
        banners.add(BannerDto.fromJson(bannerJson).toDomain());
      }
    }
    return banners;
  }
}
