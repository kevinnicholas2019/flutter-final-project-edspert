part of 'register_page_bloc.dart';

class RegisterPageState {
  final EmailAddress emailAddress;
  final NamaLengkap namaLengkap;
  final JenisKelamin jenisKelamin;
  final Kelas kelas;
  final NamaSekolah namaSekolah;
  final bool isSubmited;

  const RegisterPageState._({
    required this.emailAddress,
    required this.namaLengkap,
    required this.jenisKelamin,
    required this.kelas,
    required this.namaSekolah,
    this.isSubmited = false,
  });

  const factory RegisterPageState({
    required EmailAddress emailAddress,
    required NamaLengkap namaLengkap,
    required JenisKelamin jenisKelamin,
    required Kelas kelas,
    required NamaSekolah namaSekolah,
    bool isSubmited,
  }) = RegisterPageState._;

  factory RegisterPageState.initial() => RegisterPageState._(
        emailAddress: EmailAddress(''),
        namaLengkap: NamaLengkap(''),
        jenisKelamin: JenisKelamin(''),
        kelas: Kelas(''),
        namaSekolah: NamaSekolah(''),
      );

  factory RegisterPageState.initEmailAndName(String email, String name) =>
      RegisterPageState._(
        emailAddress: EmailAddress(email),
        namaLengkap: NamaLengkap(name),
        jenisKelamin: JenisKelamin(''),
        kelas: Kelas(''),
        namaSekolah: NamaSekolah(''),
      );
}
