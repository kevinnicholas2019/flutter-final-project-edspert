import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_objects.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';
import 'package:final_project_edspert/domain/users/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final String value;

  EmailAddress._(this.value);

  factory EmailAddress(String value) => EmailAddress._(value);

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, String>>[
        IsEmailKosong(),
        IsEmailValid(),
      ].validate(value);
}

class NamaLengkap extends ValueObject<String> {
  @override
  final String value;

  NamaLengkap._(this.value);

  factory NamaLengkap(String value) => NamaLengkap._(value);

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, String>>[
        IsNamaLengkapKosong(),
        IsNamaLengkapHaveSymbols(),
      ].validate(value);
}

class JenisKelamin extends ValueObject<String> {
  @override
  final String value;

  JenisKelamin._({required this.value});

  factory JenisKelamin(String value) => JenisKelamin._(value: value);

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, String>>[
        IsJenisKelaminChoosed(),
      ].validate(value);
}

class Kelas extends ValueObject<String> {
  @override
  final String value;

  Kelas._({required this.value});

  factory Kelas(String value) => Kelas._(value: value);

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, String>>[
        IsKelasChoosed(),
      ].validate(value);
}

class NamaSekolah extends ValueObject<String> {
  @override
  final String value;

  NamaSekolah._({required this.value});

  factory NamaSekolah(String value) => NamaSekolah._(value: value);

  @override
  List<ValueFailures<String>> failures() => <ValueValidators<String, String>>[
        IsNamaSekolahKosong(),
        IsNamaSekolahHadSymbol(),
      ].validate(value);
}
