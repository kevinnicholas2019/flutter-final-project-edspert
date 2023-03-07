import 'package:bloc/bloc.dart';
import 'package:final_project_edspert/domain/auth/auth_failures.dart';
import 'package:final_project_edspert/domain/auth/i_auth_facade.dart';
import 'package:flutter/material.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final IAuthFacade authFacade = IAuthFacade();

  LoginPageBloc() : super(LoginPageInitial()) {
    on<SignInWithGoogle>((event, emit) async {
      emit(LoginPageInitial());
      emit(SignInWithGoogleState());
      final fail = await authFacade.signInWithGoogle();
      if (fail != null) {
        emit(SignInError(fail.failedValue));
      } else {
        final user = authFacade.getSignedInUser()!;
        emit(SignInSuccess(
          displayName: user.displayName,
          email: user.email,
        ));
      }
    });
    on<SignInWithApple>((event, emit) {
      authFacade.signInWithApple();
    });
    on<SignedOut>((event, emit) {});
  }
}
