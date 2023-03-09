import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/banners/banner.dart';
import 'package:final_project_edspert/domain/banners/i_banner_repository.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final IBannerRepository _repo = IBannerRepository();

  BannerBloc() : super(BannerInitial()) {
    on<OnGetBanners>((event, emit) async {
      emit(BannerOnLoad());
      try {
        emit(BannerOnSuccess(banners: await _repo.getBanners()));
      } on Error catch (err) {
        emit(BannerOnFail(err.toString()));
      }
    });
  }
}
