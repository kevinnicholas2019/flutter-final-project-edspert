part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageState {}

class LoginPageInitial implements LoginPageState {}

// class LoginPageAuthenticated implements LoginPageState {
//   final User user;

//   LoginPageAuthenticated(this.user);
// }

// class LoginPageUnauthenticated implements LoginPageState {}

class SignInWithGoogleState implements LoginPageState {}

class SignInWithAppleState implements LoginPageState {}

class SignInSuccess implements LoginPageState {
  final String? email;
  final String? displayName;

  SignInSuccess({
    this.email,
    this.displayName,
  });
}

class SignInError implements LoginPageState {
  final String errorMsg;

  SignInError(this.errorMsg);
}
