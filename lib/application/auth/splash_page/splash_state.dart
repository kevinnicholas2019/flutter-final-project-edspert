part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashAuthenticate extends SplashState {
  final auth.User userCredential;
  final User user;

  SplashAuthenticate(this.userCredential, this.user);
}

class SplashAuthenticateNoRegister extends SplashState {
  final auth.User userCredential;

  SplashAuthenticateNoRegister(this.userCredential);
}

class SplashUnauthenticate extends SplashState {}
