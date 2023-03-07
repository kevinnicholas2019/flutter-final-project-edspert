// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/auth/i_auth_facade.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IAuthFacade _authFacade = IAuthFacade();

  SplashBloc() : super(SplashInitial()) {
    on<SplashEventOnLoad>((event, emit) async {
      var user = await _authFacade.getSignedInUser();
      emit(user == null ? SplashUnauthenticate() : SplashAuthenticate());
    });
  }
}
