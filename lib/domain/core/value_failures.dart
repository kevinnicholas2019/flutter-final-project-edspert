abstract class ValueFailures<T> {
  const ValueFailures();

  T get failedValue;
}

class UniqueIdParseFail implements ValueFailures<String> {
  @override
  String get failedValue =>
      "(UniqueIdParseFail) ID parse error fromString method";
}

class InvalidNameFail implements ValueFailures<String> {
  final String namaField;

  const InvalidNameFail(this.namaField);

  @override
  String get failedValue => "$namaField tidak boleh mengandung simbol";
}

class KosongFail implements ValueFailures<String> {
  final String namaField;

  const KosongFail(this.namaField);

  @override
  String get failedValue => "$namaField tidak boleh kosong";
}

class BelumDipilihFail implements ValueFailures<String> {
  final String namaField;

  const BelumDipilihFail(this.namaField);

  @override
  String get failedValue => "$namaField harus dipilih";
}

class InvalidUrlFail implements ValueFailures<String> {
  @override
  String get failedValue => "URL tidak valid";
}
