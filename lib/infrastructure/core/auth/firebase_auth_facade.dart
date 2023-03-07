import 'package:final_project_edspert/domain/auth/auth_failures.dart';
import 'package:final_project_edspert/domain/auth/i_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
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

  FirebaseAuthFacade._();

  factory FirebaseAuthFacade() => FirebaseAuthFacade._();

  @override
  auth.User? getSignedInUser() => _firebaseAuth.currentUser;

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
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => null);
    } on PlatformException catch (_) {
      return AuthFailServerError();
    }
  }

  @override
  Future<AuthFail?> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }
}
