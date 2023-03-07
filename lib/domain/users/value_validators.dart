import 'package:final_project_edspert/domain/core/value_failures.dart';
import 'package:final_project_edspert/domain/core/value_validators.dart';
import 'package:final_project_edspert/domain/users/user_failures.dart';

final _emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final _nameRegex = RegExp(r'^[a-zA-Z0-9 ]+$');

class IsEmailValid implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {EmailNotValidFail(): _emailRegex.hasMatch(value)};
}

class IsEmailKosong implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const KosongFail("Email"): value.isNotEmpty};
}

class IsNamaLengkapHaveSymbols implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) => {
        const InvalidNameFail("Nama lengkap"):
            value.isNotEmpty ? _nameRegex.hasMatch(value) : true,
      };
}

class IsNamaLengkapKosong implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const KosongFail("Nama lengkap"): value.isNotEmpty};
}

class IsJenisKelaminChoosed implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const BelumDipilihFail("Jenis kelamin"): value.isNotEmpty};
}

class IsKelasChoosed implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const BelumDipilihFail("Kelas"): value.isNotEmpty};
}

class IsNamaSekolahKosong implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) =>
      {const KosongFail("Nama sekolah"): value.isNotEmpty};
}

class IsNamaSekolahHadSymbol implements ValueValidators<String, String> {
  @override
  Map<ValueFailures<String>, bool> validate(String value) => {
        const InvalidNameFail("Nama sekolah"):
            value.isNotEmpty ? _nameRegex.hasMatch(value) : true,
      };
}
