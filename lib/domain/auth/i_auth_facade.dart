import 'package:final_project_edspert/domain/auth/auth_failures.dart';
import 'package:final_project_edspert/infrastructure/auth/firebase_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class IAuthFacade {
  static final IAuthFacade _instance = FirebaseAuthFacade();
  factory IAuthFacade() => _instance;

  Future<AuthFail?> signInWithGoogle();
  Future<AuthFail?> signInWithApple();
  Future<auth.User?> getSignedInUser();
}
