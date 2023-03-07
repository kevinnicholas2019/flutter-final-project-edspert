import 'package:final_project_edspert/domain/core/entity.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/users/value_objects.dart';

class User implements IEntity {
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
