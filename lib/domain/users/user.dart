import 'package:final_project_edspert/domain/core/entity.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/users/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class User implements IEntity {
  static User _instance = User(
    emailAddress: EmailAddress(''),
    namaLengkap: NamaLengkap(''),
    jenisKelamin: JenisKelamin(''),
    kelas: Kelas(''),
    namaSekolah: NamaSekolah(''),
  );
  factory User.currentUser() => _instance;
  static set currUser(User user) {
    _instance = user;
  }

  static auth.User? _instanceFirebaseCredential;
  static firebaseCredential() => _instanceFirebaseCredential;
  static set setFirebaseCredential(auth.User user) {
    _instanceFirebaseCredential = user;
  }

  const User({
    required this.emailAddress,
    required this.namaLengkap,
    required this.jenisKelamin,
    required this.kelas,
    required this.namaSekolah,
  });

  @override
  UniqueId get id => UniqueId("0");
  final EmailAddress emailAddress;
  final NamaLengkap namaLengkap;
  final JenisKelamin jenisKelamin;
  final Kelas kelas;
  final NamaSekolah namaSekolah;
}
