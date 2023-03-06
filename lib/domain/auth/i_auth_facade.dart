import 'package:final_project_edspert/infrastructure/core/auth/auth_facade.dart';

abstract class IAuthFacade {
  static final IAuthFacade _instance = AuthFacade();
  factory IAuthFacade() => _instance;

  signInWithGoogle();
  signInWithApple();
}
