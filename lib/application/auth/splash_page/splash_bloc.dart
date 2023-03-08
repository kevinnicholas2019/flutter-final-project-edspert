// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/auth/i_auth_facade.dart';
import 'package:final_project_edspert/domain/users/i_user_repository.dart';
import 'package:final_project_edspert/domain/users/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IAuthFacade _authFacade = IAuthFacade();
  final IUserRepository _userRepository = IUserRepository();

  SplashBloc() : super(SplashInitial()) {
    on<SplashEventOnLoad>((event, emit) async {
      var userCredential = await _authFacade.getSignedInUser();
      var user = await _userRepository.getUser();
      final SplashState chooseState;
      if (userCredential != null && user != null) {
        chooseState = SplashAuthenticate(userCredential, user);
        User.currUser = user;
        User.setFirebaseCredential = userCredential;
      } else if (userCredential != null && user == null) {
        chooseState = SplashAuthenticateNoRegister(userCredential);
        User.setFirebaseCredential = userCredential;
      } else {
        chooseState = SplashUnauthenticate();
      }
      emit(chooseState);
    });
  }
}
