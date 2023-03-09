import 'package:flutter/material.dart';

abstract class IBannerRepository {
  Future<List<Banner>> getBanners();
}
