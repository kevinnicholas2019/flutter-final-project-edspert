import 'package:final_project_edspert/domain/auth/auth_failures.dart';
import 'package:final_project_edspert/domain/auth/i_auth_facade.dart';
import 'package:final_project_edspert/domain/users/i_user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '516417498596-vg98v3t0v1n71i239j0nrqhhbjqurgb9.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final IUserRepository _userRepo = IUserRepository();

  FirebaseAuthFacade._();

  factory FirebaseAuthFacade() => FirebaseAuthFacade._();

  @override
  Future<auth.User?> getSignedInUser() async {
    try {
      final googleUser =
          await _googleSignIn.signInSilently(suppressErrors: false);
      if (googleUser != null) {
        final googleAuthentication = await googleUser.authentication;
        final authCredential = auth.GoogleAuthProvider.credential(
          accessToken: googleAuthentication.accessToken,
          idToken: googleAuthentication.idToken,
        );
        await _firebaseAuth.signInWithCredential(authCredential);
      }
    } on PlatformException catch (err) {
      if (err.code == "sign_in_required") {
        return null;
      }
    }

    return _firebaseAuth.currentUser;
  }

  @override
  Future<AuthFail?> signInWithGoogle() async {
    try {
      final googleUser =
          await _googleSignIn.signIn().onError((error, stackTrace) {
        return null;
      });

      if (googleUser == null) {
        return AuthFailCancelled();
      }

      final googleAuthentication = await googleUser.authentication;
      final authCredential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      await _firebaseAuth.signInWithCredential(authCredential);

      return null;
    } on PlatformException catch (_) {
      return AuthFailServerError();
    } on Exception catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }

    return null;
  }

  @override
  Future<AuthFail?> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<List<void>> signOut() async {
    return await Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
      _userRepo.clear(),
    ]);
  }
}
