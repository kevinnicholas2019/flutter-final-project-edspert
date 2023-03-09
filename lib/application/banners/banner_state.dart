part of 'banner_bloc.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}

class BannerOnLoad extends BannerState {}

class BannerOnSuccess extends BannerState {
  final List<Banner> banners;

  BannerOnSuccess({required this.banners});
}

class BannerOnFail extends BannerState {
  final String failedMsg;

  BannerOnFail(this.failedMsg);
}
