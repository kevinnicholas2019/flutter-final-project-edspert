part of 'edit_profile_bloc.dart';

class EditProfileState {
  final EmailAddress emailAddress;
  final NamaLengkap namaLengkap;
  final JenisKelamin jenisKelamin;
  final Kelas kelas;
  final NamaSekolah namaSekolah;
  final bool isSubmited;

  const EditProfileState._({
    required this.emailAddress,
    required this.namaLengkap,
    required this.jenisKelamin,
    required this.kelas,
    required this.namaSekolah,
    this.isSubmited = false,
  });

  const factory EditProfileState({
    required EmailAddress emailAddress,
    required NamaLengkap namaLengkap,
    required JenisKelamin jenisKelamin,
    required Kelas kelas,
    required NamaSekolah namaSekolah,
    bool isSubmited,
  }) = EditProfileState._;

  factory EditProfileState.initial() => EditProfileState._(
        emailAddress: User.currentUser().emailAddress,
        namaLengkap: User.currentUser().namaLengkap,
        jenisKelamin: User.currentUser().jenisKelamin,
        kelas: User.currentUser().kelas,
        namaSekolah: User.currentUser().namaSekolah,
      );
}
