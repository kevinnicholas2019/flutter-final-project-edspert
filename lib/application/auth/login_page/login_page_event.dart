part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageEvent {}

class SignInWithGoogle implements LoginPageEvent {}

class SignInWithApple implements LoginPageEvent {}

class SignedOut implements LoginPageEvent {}
