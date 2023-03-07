import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';
import 'package:final_project_edspert/domain/users/user_failures.dart';

class IsEmailValid implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) => {
        EmailNotValidFail(): RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)
      };
}

class IsEmailKosong implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const KosongFail("Email"): value != ""};
}

class IsNamaLengkapKosong implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const KosongFail("Nama lengkap"): value != ""};
}

class IsJenisKelaminChoosed implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const BelumDipilihFail("Jenis kelamin"): value != ""};
}

class IsKelasChoosed implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const BelumDipilihFail("Kelas"): value != ""};
}

class IsNamaSekolahKosong implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const KosongFail("Nama sekolah"): value != ""};
}
