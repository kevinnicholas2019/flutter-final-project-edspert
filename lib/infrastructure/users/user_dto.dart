import 'package:final_project_edspert/domain/users/user.dart';
import 'package:final_project_edspert/domain/users/value_objects.dart';

class UserDto {
  final String emailAddress;
  final String namaLengkap;
  final String jenisKelamin;
  final String kelas;
  final String namaSekolah;

  const UserDto._({
    required this.emailAddress,
    required this.namaLengkap,
    required this.jenisKelamin,
    required this.kelas,
    required this.namaSekolah,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto._(
        emailAddress: json['emailAddress'] as String,
        namaLengkap: json['namaLengkap'] as String,
        jenisKelamin: json['jenisKelamin'] as String,
        kelas: json['kelas'] as String,
        namaSekolah: json['namaSekolah'] as String,
      );

  factory UserDto.fromDomain(User user) {
    return UserDto._(
      emailAddress: user.emailAddress.value,
      namaLengkap: user.namaLengkap.value,
      jenisKelamin: user.jenisKelamin.value,
      kelas: user.kelas.value,
      namaSekolah: user.namaSekolah.value,
    );
  }

  User toDomain() {
    return User(
      emailAddress: EmailAddress(emailAddress),
      namaLengkap: NamaLengkap(namaLengkap),
      jenisKelamin: JenisKelamin(jenisKelamin),
      kelas: Kelas(kelas),
      namaSekolah: NamaSekolah(namaSekolah),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "emailAddress": emailAddress,
      "namaLengkap": namaLengkap,
      "jenisKelamin": jenisKelamin,
      "kelas": kelas,
      "namaSekolah": namaSekolah,
    };
  }
}
